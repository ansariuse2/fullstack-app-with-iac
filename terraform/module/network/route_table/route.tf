resource "aws_route_table" "valoriz_public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "Valoriz-PublicRouteTable"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.valoriz_public_rt
}

output "route_table_id" {
  value = aws_route_table.valoriz_public_rt
}