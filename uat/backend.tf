terraform {
  backend "s3"{
      region = "ap-southeast-1"
      bucket = "tfstate-phong-b2112"
      key = "uat/terraform.tfstate"
  }
}