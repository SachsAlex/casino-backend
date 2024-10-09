variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "eu-central-1"
}

variable "instance_class" {
  description = "RDS instance type"
  default     = "db.t4g.micro"
}
