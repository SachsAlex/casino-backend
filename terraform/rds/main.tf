data "terraform_remote_state" "casino_vpc" {
  backend = "s3"
  config = {
    bucket = "casino-2310-bucket"
    key    = "ec2-casino/vpc.tfstate"
    region = var.aws_region
  }
}

data "aws_ssm_parameter" "password" {
  name = "db-password"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [data.terraform_remote_state.casino_vpc.outputs.subnet_id1, data.terraform_remote_state.casino_vpc.outputs.subnet_id2]
}



resource "aws_db_instance" "casino_rds" {
  instance_class         = var.instance_class
  engine                 = "mysql"
  engine_version         = "8.0.39"
  allocated_storage      = 10
  username               = var.username
  password               = data.aws_ssm_parameter.password
  publicly_accessible    = true
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "Casino-Database"
  }
}
