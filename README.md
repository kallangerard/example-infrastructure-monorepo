# example-infrastructure-monorepo

```tree
snowflake-cluster/
common/
  inputs.tf
  outputs.tf
  providers.tf
dev/
  inputs.tf -> ../common/inputs.tf
  main.tf
  outputs.tf -> ../common/outputs.tf
  providers.tf
uat/
  inputs.tf -> ../common/inputs.tf
  main.tf
  outputs.tf -> ../common/outputs.tf
  providers.tf
prod/
  inputs.tf -> ../common/inputs.tf
  main.tf
  outputs.tf -> ../common/outputs.tf
  providers.tf
stack/
  v1/
    inputs.tf
    outputs.tf
    s3-buckets.tf
    snowflake-roles.tf
    snowflake-warehouses.tf
    terraform.tf
```
