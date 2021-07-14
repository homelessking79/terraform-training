# Terraform & Ansible Lab

## Description

This project create EC2 instances infrastructure to host a static website with Nginx server. Using Terraform for IaC and Ansible for Configuration Management

## Architecture

![alt text][logo]

[logo]: ./architecture.png

## Usage

### Prerequisite

Have AWS credentials configuration. Some recommended ways:
* aws-vault session
* Export to environments variable
* Use as Terraform variables
Installed Terraform version >= 0.13
Installed Ansible
Already have a S3 Bucket for backend remote state
### Setup backend remote state
Change the region, bucket, key into yours.
```
terraform {
  backend "s3"{
      region = "ap-southeast-1"
      bucket = "tfstate-phong-b2112"
      key = "dev/terraform.tfstate"
  }
}
```
### Provisioning Infrastructure 
For each environment, you need to change directory to particular environment (dev, uat, prod) folder and run following command

```
terraform init
terraform plan --out "tfplan"
terraform apply "tfplan"
```

Clean-up
```
terraform destroy
```

### Module Development
Update code in Modules/