output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2-casino-backend.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.ec2-casino-backend.public_ip
}