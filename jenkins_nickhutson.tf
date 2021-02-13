provider "aws" {
access_key = "AKIA4M3YDSVS65HVNAVS"
secret_key = "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"
region = "us-east-1"
}


resource "aws_security_group" "web-node" {
  name = "web-node"
  description = "Web Security Group"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  ingress {
    from_port = 443
    to_port = 443
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
# Resource Configuration for AWS
resource "aws_instance" "myserver" {
ami = "ami-032e26fff3bb717f3"
instance_type = "t2.micro"
key_name = "webserver"
vpc_security_group_ids = ["sg-0cae4655995ac6fb4"]
tags = {
Name = "helloworld_terraform"
}
}