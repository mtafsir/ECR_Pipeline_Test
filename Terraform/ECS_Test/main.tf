terraform { 
 required_version = ">= 0.15"

  # Terraform backend
  backend "s3" {
    bucket = "mtafsir"
    key    = "ECR-Test/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt = "true"
  }

}



#provider "aws" {
# profile = "new-tf-user"
# region = "us-east-1"
#}

#variable "ecr_repository" {
#  type = string
#}

# private by default
resource "aws_ecr_repository" "Monitoring_repository" {
  name                 = "test_ecr3"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

locals  {
  ecrRepository = aws_ecr_repository.Monitoring_repository.repository_url
}

#resource "null_resource" "example" {
  # A flag to make this always trigger on terraform apply. This will allow for a CI/CD for the image
#   triggers = {
#    always_run = timestamp()
#  }
  
#  provisioner "local-exec" {
#    command = <<-EOT
#      go run Docker_push/Docker_push.go -uri=${aws_ecr_repository.Monitoring_repository.repository_url} -imageName="testingName" -activeDirectory=$(pwd)

#    EOT
       

#  }
#}

output "name" {
  value       = local.ecrRepository
  sensitive   = false
  description = "This is the ecr url"
}