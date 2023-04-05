module "data_stack" {
  source = "../../data-driven/v2_beta"
}

provider "snowflake" {
  role        = "ACCOUNTADMIN"
  username    = "TERRAFORM_SVC_ACCOUNT"
  account     = "MR-UAT-ACCOUNT"
  private_key = var.MR_UAT_ACCOUNT_TF_SVC_PRIVATE_KEY
}
