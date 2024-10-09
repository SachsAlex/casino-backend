terraform {
  backend "s3" {
    bucket = "casino-2310-bucket"
    key    = "ec2-casino/rds.tfstate"
    region = "eu-central-1"
  }
}