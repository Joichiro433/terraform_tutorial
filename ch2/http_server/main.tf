variable "instance_type" {}

data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-kernel-5.10-hvm-x86_64-gp2"
}

resource "aws_instance" "default" {
  ami                    = data.aws_ssm_parameter.amzn2_ami.value
  vpc_security_group_ids = [aws_security_group.default.id]
  instance_type          = var.instance_type

  user_data = file("./user_data.sh")

  tags = {
    Name = "demo"
  }
}

resource "aws_security_group" "default" {
  name = "ec2"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_dns" {
  value = aws_instance.default.public_dns
}