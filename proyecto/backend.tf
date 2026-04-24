terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "bucket-yennyfergomez-terraform"
    key     = "proyectoec2/yennyfergomez/terraform.tfstate"
    encrypt = true


  }
}
