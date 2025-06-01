# Module configuration for Terragrunt

include {
    path = find_in_parent_folders()
}

terraform {
  source = "TERRAFORM_MODULE_SOURCE" # Replace with your Terraform module source
}

input {
  # Define your module inputs here
  # example_variable = "example_value" # Replace with actual variable names and values
}

# dependency "remote_state" {
#   config_path = "../module_name" # Adjust the path to your environment terragrunt file
# }
