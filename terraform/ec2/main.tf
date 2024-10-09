data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "casino-2310-bucket"
    key    = "ec2-casino-backend/vpc.tfstate"
    region = var.aws_region
  }
}

resource "aws_instance" "my_instance" {
  ami                         = "ami-01e444924a2233b07"
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id1
  security_groups             = [aws_security_group.http.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "MyInstance"
  }
}