terraform { 
 required_version = "> 1.1.7"

  # Terraform backend
  backend "s3" {
    bucket = "mtafsir"
    key    = "ECR-Test/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt = "true"
  }

}


resource "aws_ecr_repository" "Monitoring_repository" {
  name                 = "test_ecr3"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}


module vpc {

  source = "./modules/vpc"

  infra_env = "Monitoring"
  vpc_cidr = "10.0.0.0/17"
}


module subnet {

  source = "./modules/subnet"

  vpc_id                      = module.vpc.vpc_id
  infra_env                   = "Monitoring"
  public_subnet               = "10.0.1.0/24"
  private_subnet              = "10.0.2.0/24"
  public_availability_zone    = "us-east-1"
  private_availiability_zone  = "us-east-1"
}
