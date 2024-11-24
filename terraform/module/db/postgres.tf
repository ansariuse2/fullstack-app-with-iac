resource "aws_db_instance" "restaurant_db" {
  allocated_storage    = 5
  storage_type       = "gp2"
  engine             = "postgres"
  engine_version     = "14.1"  # Specify your desired version
  instance_class     = "db.t2.micro"
  #name               = "restaurant_db"
  username           = "restaurant_user"
  password           = "abcd123"
  skip_final_snapshot = true
  publicly_accessible = true

  vpc_security_group_ids = [aws_security_group.default.id]
}

resource "aws_security_group" "default" {
  name        = "allow_postgres"
  description = "Allow PostgreSQL access"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]  # Change this to restrict access
  
  #  cidr_blocks = take from top variable
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "db_endpoint" {
  value = aws_db_instance.restaurant_db.endpoint
}

output "db_username" {
  value = aws_db_instance.restaurant_db.username
}

output "db_password" {
  value = aws_db_instance.restaurant_db.password
}