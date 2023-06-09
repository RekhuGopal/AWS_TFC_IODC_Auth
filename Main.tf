## backend data for terraform
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "remote" {
  organization = "CloudQuickLabs"

    workspaces {
      name = "TFC-AWS-OIDC"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  assume_role_with_web_identity {
  role_arn                = "arn:aws:iam::357171621133:role/TFC-AWS-OIDC"
  session_name            = "SESSION_NAME"
  web_identity_token_file = "/Users/tf_user/secrets/web-identity-token"
}
}

module "BackupIAM" {
  source = "./BackupIAM"
}

module "BackupInfra" {
  source = "./BackupInfra"
  depends_on = [module.BackupIAM]
}