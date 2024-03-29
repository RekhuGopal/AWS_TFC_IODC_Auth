## backend data for terraform
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.66.0"
    }
  }
 
backend "remote" {
  organization = "CloudQuickLabs"

    workspaces {
      name = "TFC-AWS-OIDC"
    }
  }
}
