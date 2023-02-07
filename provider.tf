provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "test123-bucket135"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-dev-state-locking"
    encrypt = true
  }
}
