variable "AMI" {
  type        = string
  description = "Image for ubuntu instance"
  default = "ami-053b0d53c279acc90"
}

variable "TYPE" {
  type        = string
  description = "Instance type"
  default = "t3.micro"
}

variable "vpc" {
  type        = string
  description = "vpc ID"
}

variable "security_group" {
  type = string
  description = "Security Group ID"
}

variable "subnets_1a" {
  type = string
  description = "Subnets id for subnets in AZ us-east-1a"
}

variable "NAME_TAG" {
  type = string
  description = "Tags by environment"
}

variable "KEY_NAME" {
  type = string
  default = "liorm-tf-key_rsa"
}
# variable "public_key_content" {
#   type = string
#   description = "key for instance"
# }