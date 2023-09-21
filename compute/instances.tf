resource "aws_key_pair" "liorm-tf-key_rsa" {
  key_name   = "liorm-tf-key_rsa"
  public_key = file("~/.ssh/liorm-tf-key_rsa.pub")
}

resource "aws_instance" "liorm-EC2-1a" {
  count = 2
# count = terraform.workspace == "default" ? 2 : 1
  ami                    = var.AMI
  instance_type          = var.TYPE
  key_name               = aws_key_pair.liorm-tf-key_rsa.id
  subnet_id = var.subnets_1a
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [var.security_group]

  user_data = file("./compute/userdata.sh")

  tags = {
    Name = "project-DIR-${var.NAME_TAG}"
  }
}

resource "aws_instance" "liorm-EC2-1b" {
  count = 2
# count = terraform.workspace == "default" ? 2 : 1

  ami                    = var.AMI
  instance_type          = var.TYPE
  key_name               = aws_key_pair.liorm-tf-key_rsa.id
  subnet_id = var.subnets_1b
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [var.security_group]

  user_data = file("./compute/userdata.sh")

  tags = {
    Name = "project-DIR-${var.NAME_TAG}"
  }
}
