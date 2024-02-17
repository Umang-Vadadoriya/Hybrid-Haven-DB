#  defining required provider optional
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.37.0"
#     }
#   }

#   required_version = ">= 1.2.0"
# }

# configured aws provider with proper credentials
provider "aws" {
  region  = "eu-west-1"
  profile = "terraform-user"
}

# create the rds instance
resource "aws_db_instance" "myrds" {
  identifier          = "hybrid-haven-db"
  engine              = "sqlserver-ex"
  engine_version      = "15.00.4345.5.v1"
  multi_az            = false
  username            = var.username
  password            = var.password
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  skip_final_snapshot = true
  publicly_accessible = true
}

variable "username" {
  description = "The username for the DB Hybrid Haven user"
  type        = string
}

variable "password" {
  description = "The password for the DB Hybrid Haven user"
  type        = string
}

output "rds_endpoint" {
  value = "${aws_db_instance.myrds.endpoint}"
}