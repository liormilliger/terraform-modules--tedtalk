resource "aws_key_pair" "liorm-tf-key_rsa" {
  key_name   = "liorm-tf-key_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCma5oAPc4GbQX5YH+lvdY6uRR3N+u3b00HPzNr8sBea3/BiSQ77jq9CIBqmXUD5aaXtUbci5JQnk0k1oXDT0PNbvaATHG1RMJJcxoqC4aRsXLNulCY7ASpNV+njy19vu1B6pb8BSWt9Zuow34a5gjlyz/qnEwScOZjng8FT3VeVD5UidFNey1aqJndMvUTmKidVLQqN++UBG5VAERxl52hPFkYK2wlqk5XCewaTohiikNolVbYnUF188yqeccTybOqoSq3cuJhox8pdzb5TaPAkvmTcdyXvZfYh8+L71gkmqLs9wrOcGhKgGUgKNDWSIoCyY2eT1wwb7SP+vQWGF8CS80gJFACdHbhyAS0M4M9zp13uqTdyXCtzZ3UcLzQl4iT5aijyTWBLBjRktt/WjZ001pVEomIb8fI7yiibsoDbZEAexp2lX9HzA10qqpIvwJC8wPb0P5Xnbf0zs8TRNssrq5OOFogywqTab4yI17vro6dTJ9mrQHSPqCzx1TdXiRD7CfTQDVAECE6+pMD8DXHQa3XlGPZiJMMZ6ijNghuhLTqYBldsCcG+yuO9hcKWRTYwIlL1zev2ozVoU9IFG92dE2UAVolraz2cpUWPLGOvqnxy/KqdGB4rgKOMM7/RDXXTFEuEfCexAnkBw4snZGJJEz3eJnfQGaA9D2m2c9eHQ== liormilliger@lior-Lenovo-Desktop"
}
# resource "aws_key_pair" "liorm-ted-key" {
#   key_name   = "liorm-ted-key"
#   public_key = var.public_key_content
# }
data "aws_iam_role" "liorm-ec2-ecr" {
  name = "liorm-ec2-ecr"  # Replace with the actual name of your IAM role
}

resource "aws_iam_instance_profile" "access_ecr" {
  name = "liorm_EC2_to_ECR"
  role = data.aws_iam_role.liorm-ec2-ecr.name
}

resource "aws_instance" "liorm-TED" {
  count = terraform.workspace == "default" ? 1 : 3
  ami                    = var.AMI
  instance_type          = var.TYPE
  key_name               = "liorm-tf-key_rsa"
  iam_instance_profile = aws_iam_instance_profile.access_ecr.name
  subnet_id = var.subnets_1a
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [var.security_group]

  user_data = file("./compute/userdata.sh")

  tags = {
    Name = "TED-test-${var.NAME_TAG}"
  }
}