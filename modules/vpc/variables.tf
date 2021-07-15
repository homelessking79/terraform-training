
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
/* variable "subnet_cidr" {
  type = list(string)
  default = ["10.0.1.0/16"]
} */
variable "azs" {
    description = "Map of azs with az id is key & subnet cidr is value"
    type = map(string)
    default = {
        "ap-southeast-1a" = "192.168.1.0/24"
    }
}
variable "subnet_tags" {
  type    = map(string)
  default = {}
}

variable "ig_id" {
  description = "Internet Gateway's ID"
}

variable "subnet_id" {
    type = list(string)
}

variable "route_table_id" {}