# resource "aws_key_pair" "liorm-tf-key_rsa" {
#   key_name   = "liorm-tf-key_rsa"
#   public_key = file("~/.ssh/liorm-tf-key_rsa.pub")
# }
resource "aws_key_pair" "liorm-ted-key" {
  key_name   = "liorm-ted-key"
  public_key = var.public_key_content
}

resource "aws_instance" "liorm-TED" {
  count = terraform.workspace == "default" ? 1 : 3
  ami                    = var.AMI
  instance_type          = var.TYPE
  key_name               = "liorm-tf-key_rsa"
  subnet_id = var.subnets_1a
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [var.security_group]

  user_data = file("./compute/userdata.sh")

  tags = {
    Name = "TED-test-${var.NAME_TAG}"
  }
}