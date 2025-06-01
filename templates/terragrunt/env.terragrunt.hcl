# Environment terragrunt hcl file for managing environment-specific configurations

inlcude {
  path = find_in_parent_folders()
}

local {
  environment      = "ENVIRONMENT_NAME" # Replace with your environment name
  aws_region       = "AWS_REGION" # Replace with your desired AWS region
  aws_account_id   = "AWS_ACCOUNT_ID" # Replace with your AWS account ID
  aws_account_name = "AWS_ACCOUNT_NAME" # Replace with your AWS account name
  aws_role_name    = "AWS_ROLE_NAME" # Replace with your AWS IAM role name
}

# Remote state configuration for managing Terraform state files

remote_state {
  backend = "s3"
  config = {
    bucket         = "BUCKET_NAME" # Replace with your S3 bucket name
    key            = "${local.environment}/terraform.tfstate"
    region         = local.aws_region
    dynamodb_table = "DYNAMODB_TABLE_NAME" # Replace with your DynamoDB table name for state locking
    encrypt        = true
  }
}

generate "provider" {}
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  alias  = ""
  region = "${local.aws_region}"
  assume_role {
    role_arn = "arn:aws:iam::${local.aws_account_id}:role/${local.aws_role_name}" # Replace with your IAM role ARN
  }
}
EOF
}
