# variable "public_ips" {
#   type = string
#   description = "public_ips"
# }

# variable "LB_DNS" {
#   type = string
#   description = "DNS for Load Balancer"
# }

variable "NAME_TAG" {
  type        = string
  description = "name tag by environment"
}

variable "AMI" {
  type        = string
  description = "AMI"
}

variable "TYPE" {
  type        = string
  description = "instance type"
}

variable "HOME_IP" {
  type        = string
  description = "Home IP"
}

variable "KARMI_IP" {
  type        = string
  description = "Karmi IP"
}