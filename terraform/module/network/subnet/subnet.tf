resource "aws_subnet" "valoriz_vpc_public_subnet1" {
cidr_block = var.valoriz_subnet_cidr
vpc_id = var.valoriz_vpc_id
availability_zone = "ap-south-1a"

}
output "public_subnet_id" {
    value = aws_subnet.valoriz_vpc_public_subnet1.id
  
}