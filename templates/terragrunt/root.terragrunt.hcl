# Root terragrunt hcl file for managing common configurations

locals {
  common_tags = {
    Owner       = "OWNER_NAME" # Replace with your owner name
    Project     = "PROJECT_NAME" # Replace with your project name
  }
}
