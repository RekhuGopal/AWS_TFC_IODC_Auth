## backend data for terraform
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  cloud {
  organization = "CloudQuickLabs"

    workspaces {
      name = "TFC-AWS-OIDC"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  
}

module "BackupIAM" {
  source = "./BackupIAM"
}

module "BackupInfra" {
  source = "./BackupInfra"
  depends_on = [module.BackupIAM]
}