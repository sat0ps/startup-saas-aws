variable "name"            { type = string }
variable "cidr"            { type = string  default = "10.30.0.0/16" }
variable "azs"             { type = list(string) }                   # e.g. ["us-east-1a","us-east-1b"]
variable "public_subnets"  { type = list(string) }                   # e.g. ["10.30.0.0/24","10.30.1.0/24"]
variable "private_subnets" { type = list(string) }                   # e.g. ["10.30.10.0/24","10.30.11.0/24"]
