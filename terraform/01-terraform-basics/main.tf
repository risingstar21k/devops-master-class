terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
 
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  # VERSION IS NOT NEEDED HERE
}

# two step approach:
# (1) Plan
# (2) execute
resource "aws_s3_bucket" "my_s3_bucket-1" {
  bucket = "terraform-course-bkt-002"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_s3_bucket-1.id
  versioning_configuration {
    status = "Enabled"
  }
}