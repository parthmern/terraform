# key pair
resource aws_key_pair my-key {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

# default vpc
resource aws_default_vpc default{

}

# security group for vpc
resource aws_security_group my_security_group{
    name = "automate-sg"
    description = "desc"
    vpc_id = aws_default_vpc.default.id # interpolation

    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
    }

    ingress {
        from_port = 80
        to_port   = 80
        protocol  = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP open"
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"              # all ports
        cidr_blocks = ["0.0.0.0/0"]     
    }

}

# ec2 instance

resource aws_instance my_instance{
    instance_type = var.instance_type
    key_name = aws_key_pair.my-key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    # vpc_security_group_ids = [aws_security_group.my_security_group.id]
    ami = "ami-0e5497a77ef21b5ac" # ubuntu 22.04

    root_block_device {
        volume_size = var.root_volume_size
        volume_type = var.root_volume_type
    }

    tags = {
        Name = "my-ec2-instance"
    }
} 