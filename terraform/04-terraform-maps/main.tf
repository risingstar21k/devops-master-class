variable "users" {
  default = {
    ram : { country : "USA", state : "MI" },
    lakshman : { country : "USA", state : "VA" },
    krishna : { country : "INDIA", state : "TN" },
    rishi : { country : "USA", state : "VA" },
    vaishnavi : { country : "USA", state : "VA" },
  }

}


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


resource "aws_iam_user" "my_iam_users" {
  #   count = length(var.names)
  #   name  = "${var.names[count.index]}"
  for_each = var.users
  name     = each.key
  tags = {
    state   = each.value.state
    country = each.value.country
  }
}
