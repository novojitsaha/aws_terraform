variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.2.0/24"
}

variable "private_ec2_subnet_1_cidr" {
  default = "10.0.3.0/24"
}

variable "private_ec2_subnet_2_cidr" {
  default = "10.0.4.0/24"
}

variable "private_rds_subnet_1_cidr" {
  default = "10.0.5.0/24"
}

variable "private_rds_subnet_2_cidr" {
  default = "10.0.6.0/24"
}

variable "az1" {
  default = "eu-west-2a"
}

variable "az2" {
  default = "eu-west-2b"
}


variable "instance_type" {
  default     = "t4g.nano"
  description = "T4 Graviton2 Nano - 2 vCPU and 0.5 GiB"
}


variable "db_username" {
  default     = "admin"
  description = "Username for the RDS DB"
}

variable "db_password" {
  description = "Password for the RDS DB"
  sensitive   = true
}