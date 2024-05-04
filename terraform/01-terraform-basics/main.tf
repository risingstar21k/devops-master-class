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
resource "aws_s3_bucket" "my_s3_bucket-008" {
  bucket = "terraform-course-bkt-008"
}

resource "aws_iam_user" "my_iam_user" {
  name = "my_iam_user_abc_updated"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_s3_bucket-008.id
  versioning_configuration {
    status = "Enabled"
  }
}


