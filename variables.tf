variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
  default = "us-east-2"
}
variable "availability_zone" {
  default = "us-east-2a"
}
variable "public_key" {}
variable "rds_user" {}
variable "rds_pass" {}
variable "rds_version" {}
variable "rds_storage_capacity" {}
variable "rds_storage_type" {}


variable "subnet_1_cidr" {
  default     = "10.43.1.0/24"
  description = "Your AZ"
}

variable "subnet_2_cidr" {
  default     = "10.43.2.0/24"
  description = "Your AZ"
}

variable "az_1" {
  default     = "us-east-2a"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default     = "us-east-2b"
  description = "Your Az2, use AWS CLI to find your account specific"
}


variable "cidr_blocks" {
  default     = "0.0.0.0/0"
  description = "CIDR for sg"
}

variable "sg_name" {
  default     = "rds_sg"
  description = "Tag Name for sg"
}
