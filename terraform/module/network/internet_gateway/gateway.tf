resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "valoriz-IGW"
  }
}
output "igw_id" {
  value = aws_internet_gateway.igw.id
}

