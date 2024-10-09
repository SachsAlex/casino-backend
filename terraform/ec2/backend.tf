terraform {
  backend "s3" {
    bucket = "casino-2310-bucket"
    key    = "ec2-casino/ec2.tfstate"
    region = "eu-central-1"
  }
}