terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "liorm-ted"
    key    = "data/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "liorm-lockstate"
  }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"

  default_tags {
    tags = {
      Owner           = "liorm"
      bootcamp        = "19"
      expiration_date = "01-01-2025"
    }
  }
}

module "network" {
  source = "./network"

}

module "compute" {
  source = "./compute"

  vpc            = module.network.VPC_ID
  security_group = module.network.SG
  subnets_1a     = module.network.subnets_1a
  NAME_TAG       = var.NAME_TAG
  TYPE           = var.TYPE

} 