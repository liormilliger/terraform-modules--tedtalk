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
  key_name               = var.KEY_NAME
  iam_instance_profile = aws_iam_instance_profile.access_ecr.name
  subnet_id = var.subnets_1a
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [var.security_group]

  user_data = file("./compute/userdata.sh")

  tags = {
    Name = "TED-test-${var.NAME_TAG}"
  }
}