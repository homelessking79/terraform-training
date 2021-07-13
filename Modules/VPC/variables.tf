
variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  default     = "10.0.0.0/16"
}

variable "tenancy" {
  description = "VPC tenancy"
  default     = "default"
}

variable "vpc_tags" {
  description = "Tags of the VPC"
  type        = map(string)
  default     = {}
}
variable "vpc_id" {
  description = "VPC id - used for assigning subnet into particular VPC"
}
variable "subnet_cidr" {
  default = "10.0.1.0/16"
}
variable "subnet_tags" {
  type    = map(string)
  default = {}
}

variable "ig_id" {
  description = "Internet Gateway's ID"
}

variable "subnet_id" {}

variable "route_table_id" {}