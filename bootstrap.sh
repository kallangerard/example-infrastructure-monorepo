#!/usr/bin/env bash

# -e - Exit immediately if a command exits with a non-zero status
# -u - Treat unset variables as an error when substituting
# -o pipefail - Option pipefail - Catch failures in any part of a pipeline
set -e -u -o pipefail

bucket_policy=$(
    jq . <<EOL
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::${TF_BACKEND_S3_BUCKET_NAME}"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::${TF_BACKEND_S3_BUCKET_NAME}/*"
    }
  ]
}
EOL
)

# Create S3 bucket for Terraform backend
aws s3api create-bucket \
    --bucket "$TF_BACKEND_S3_BUCKET_NAME" \
    --object-ownership BucketOwnerEnforced \
    --create-bucket-configuration LocationConstraint="$AWS_REGION"

# Enable versioning on the S3 bucket
aws s3api put-bucket-versioning --bucket "$TF_BACKEND_S3_BUCKET_NAME" --versioning-configuration Status=Enabled

# Create Bucket Policy for S3 Bucket
aws s3api put-bucket-policy \
    --bucket "$TF_BACKEND_S3_BUCKET_NAME" \
    --policy "$bucket_policy"

# Create DynamoDB table for Terraform state locking
aws dynamodb create-table \
    --table-name "$TF_BACKEND_S3_DYNAMODB_TABLE_NAME" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region "$AWS_REGION"

# TODO: Get Fingerprint
# TODO: Confirm Script is correct

# # # Set up OIDC identity provider
# # github_oidc_url="https://token.actions.githubusercontent.com"
# # aws_oidc_provider_name="github_oidc_provider"
# # github_audience="sts.amazonaws.com"

# # aws iam create-open-id-connect-provider \
# #     --url $github_oidc_url \
# #     --thumbprint-list "<thumbprint>" \
# #     --client-id-list $github_audience \
# #     --url $aws_oidc_provider_name
