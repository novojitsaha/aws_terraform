# Subnet group (private subnets in two AZs)
resource "aws_db_subnet_group" "app" {
  name       = "app-db-subnet-group"
  subnet_ids = [
    aws_subnet.private_rds_1.id,
    aws_subnet.private_rds_2.id
  ]

  tags = {
    Name = "App DB Subnet Group"
  }
}

# RDS Instance (Multi-AZ)
resource "aws_db_instance" "app" {
  identifier              = "app-db"
  allocated_storage       = 8
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t4g.micro"
  db_subnet_group_name    = aws_db_subnet_group.app.name
  multi_az                = true
  username                = var.db_username
  password                = var.db_password
  vpc_security_group_ids  = [aws_security_group.rds.id]
  skip_final_snapshot     = true
  publicly_accessible     = false

  tags = {
    Name = "App RDS MySQL"
  }
}
