
variable "infra_env" {

    type        = string
    description = "infrastructure environment"

}

variable "vpc_id" {

    type        = string
    description = "This is the vpc for the subnet"

}


variable "public_subnet" {

    type        = string
    description = "Public subnet CIDR block"

}

variable "public_availability_zone" {

    type        = string
    description = "Availability zone being used for public subnet"

}

variable "private_subnet" {

    type        = string
    description = "Private subnet CIDR block"
}

variable "private_availiability_zone" {

    type        = string
    description = "Availability zone being used for private subnet"

}