terraform {
  backend "s3" {
    bucket = "claudiosp-tfstate-dev83"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
