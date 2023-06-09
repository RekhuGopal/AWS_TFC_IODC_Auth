provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
  token      = var.token
}

module "BackupIAM" {
  source = "./BackupIAM"
}

module "BackupInfra" {
  source = "./BackupInfra"
  depends_on = [module.BackupIAM]
}