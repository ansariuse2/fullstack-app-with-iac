resource "aws_vpc" "valoriz_vpc" {
    tags = {
      Name:"VPC_FOR_VALORIZ"
    }
    cidr_block = "var.valoriz_vpc_cidr_block"
    enable_dns_hostnames = true
    enable_dns_support = true
}
    output "valoriz_vpc_id" {
    value = aws_vpc.valoriz_vpc.vpc.valoriz_vpc_id
    }
      

