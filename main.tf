# # creating a vpc using variable
# resource "aws_vpc" "vpc_for_dev" {
#   cidr_block       = var.vpc_cidr
#   instance_tenancy = var.instance_tenancy

#   tags = {
#     Name = var.vpc_name
#   }
# }
# # creating a internet-gateway using variable
# resource "aws_internet_gateway" "igw-for-dev-vpc" {
#   vpc_id = aws_vpc.vpc_for_dev.id

#   tags = {
#     Name = var.igw_for_dev_vpc
#   }
# }

# # creating public-subnet using variable 
# resource "aws_subnet" "public_subnet" {
#   vpc_id     = aws_vpc.vpc_for_dev.id
#   cidr_block = var.cidr_block_for_subnets.0
#   map_public_ip_on_launch = var.map_public_ip

#   tags = {
#     Name = var.subnet_name.0
#   }
# }
# # creating private-subnet using variable
# resource "aws_subnet" "private_subnet" {
#   vpc_id     = aws_vpc.vpc_for_dev.id
#   cidr_block = var.cidr_block_for_subnets.1

#   tags = {
#     Name = var.subnet_name.1
#   }
# }

# # Allocate an Elastic IP for the NAT Gateway
# resource "aws_eip" "nat_eip" {
#   vpc = true
# }

# # Create a NAT Gateway
# resource "aws_nat_gateway" "nat_gateway_for_dev_vpc" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = var.nat_gateway_subnet_id

#   tags = {
#     Name = var.nat_gateway_name
#   }
# }
# # Create a route table for private subnets with NAT Gateway
# resource "aws_route_table" "RT_for_dev_vpc" {
#   vpc_id = aws_vpc.vpc_for_dev.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway_for_dev_vpc.id
#   }

#   tags = {
#     Name = var.RT_for_dev_vpc
#   }
# }

# # Associate the route table with private subnets
# # resource "aws_route_table_association" "private_route_table_association" {
# #   for_each = toset(var.private_subnet_ids_for_dev_vpc)

# #   subnet_id      = each.value
# #   route_table_id = var.private_route_table_id_for_dev_vpc
# # }