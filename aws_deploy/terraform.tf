terraform {
  backend "s3" {
    bucket = "technical-test-bocc-bucket-state"
    key = "terraform.tfstate"
    region = "us-east-2"
  }
  required_version = ">= 0.12"
}