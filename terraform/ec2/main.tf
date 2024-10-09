data "terraform_remote_state" "casino_vpc" {
  backend = "s3"
  config = {
    bucket = "casino-2310-bucket"
    key    = "ec2-casino/vpc.tfstate"
    region = var.aws_region
  }
}

locals {
  ssh_user         = "ubuntu"
  key_name         = "casino-entrance-card"
  private_key_path = "\\wsl.localhost/Ubuntu/home/alexander/.ssh/casino-entrance-card.pem"
}

resource "aws_instance" "ec2-casino-backend" {
  ami                         = "ami-01e444924a2233b07"
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.casino_vpc.outputs.subnet_id1
  security_groups             = [aws_security_group.http.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "EC2-Casino-Backend"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = aws_instance.ec2-casino-backend.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.ec2-casino-backend.public_ip}, --private-key ${local.private_key_path} playbook.yaml"
  }
}