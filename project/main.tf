provider "aws" {
  region = "us-east-1"
}

module "my_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}
