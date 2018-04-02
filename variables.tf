variable "key_name" {
  description = "Key Name Created in AWS EC2"
  default = "test"
}

variable "key_address" {
  description = "Public Key .PEM file address (relative or absolute)"
  default = "./test.pem"
}

variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
}

variable "region" {
  default = "us-east-2"
  description = "AWS Region"
}

variable "availability_zone" {
  default = "us-east-2a"
  description = "AWS availability zone to be used"
}

variable "rds_user" {
  description = "RDS Username"
}

variable "rds_pass" {
  description = "RDS Password"
}

variable "rds_version" {
  description = "RDS Postgres Version"
}

variable "rds_storage_capacity" {
  description = "RDS Storage Capacity"
}

variable "rds_storage_type" {
  description = "RDS Storage Type Class"
}

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
