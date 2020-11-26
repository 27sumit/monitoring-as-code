locals {
  environment = "dev"
}

inputs = {
  newrelic_api_key = "NRAA-a3a52bd3a27381b"
  newrelic_personal_api_key = "NRAK-8PXWTVJRZPGMPD"
  newrelic_account_id = 2000072
  newrelic_region = "US"
  env_suffix = "-dev"
  env = "dev"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "wh-capmon-newrelic-eu-west-1-tfstate"
    region = "eu-west-1"
    key = "${local.environment}/${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "wh-capmon-newrelic-alerting-tflock"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "newrelic" {
  api_key = var.newrelic_personal_api_key
  admin_api_key = var.newrelic_api_key
  account_id = var.newrelic_account_id
  region = var.newrelic_region
  version = "2.12.1"
}
EOF
}

generate "variables-newrelic" {
  path = "variables-newrelic.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
# default vars
variable "newrelic_api_key" {}
variable "newrelic_personal_api_key" {}
variable "newrelic_account_id" {}
variable "newrelic_region" {}
EOF
}
