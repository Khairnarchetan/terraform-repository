# variable for creating vpc
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
  description = "CIDR for vpc"
}
variable "instance_tenancy" {
  type = string
  default = "default"
  description = "tenancy for instances in VPC"
}
variable "vpc_name" {
  type = string
  default = "dev-vpc"
  description = "name of VPC"
}

# variable for creating internet-gateway
variable "igw_for_dev_vpc" {
  type = string
  default = "igw_for_dev_VPC"
  description = "interet gateway for dev-vpc"
}

# variable for cidr block of subnet
variable "cidr_block_for_subnets" {
  type = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24"]
  description = "subnet CIDR for dev-vpc"
}
# variable for map-public-ip of subnet
variable "map_public_ip" {
 type= bool
 default = true
 description = "public Ip enable or not"
}

#variable for public/private subnet  
variable "subnet_name" {
  type = list(string)
  default = ["public_subnet","private_subnet"]
  description = "subnets for dev-vpc"
}

# Variable for NAT Gateway
variable "nat_gateway_name" {
  description = "The name of the NAT Gateway"
  type        = string
  default     = "nat_gateway_for_dev_VPC"
}

# Variable for Elastic IP allocation ID
variable "allocation_id" {
  description = "The allocation ID for the NAT Gateway (Elastic IP)"
  type        = string
}

# Variable for subnet ID where NAT Gateway will be placed
variable "nat_gateway_subnet_id" {
  description = "The ID of the subnet where the NAT Gateway will be placed"
  type        = string
}

# variable for route table
variable "RT_for_dev_vpc" {
  type = string
  default = "RT_for_dev_VPC"
  description = "Route_table for dev-vpc"

}

# # Variable for private subnet IDs
# variable "private_subnet_ids_for_dev_vpc" {
#   description = "List of private subnet IDs"
#   type        = list(string)
# }

# # Variable for the route table ID
# variable "private_route_table_id_for_dev_vpc" {
#   description = "The ID of the private route table"
#   type        = string
# }