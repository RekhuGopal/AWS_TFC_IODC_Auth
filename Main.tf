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