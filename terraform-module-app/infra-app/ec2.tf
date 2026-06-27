# key pair
resource aws_key_pair my-key {

    key_name   = "${var.env}-infra-app-key"
    public_key = file("terra-key-ec2.pub")

    tags = {
        Name        = "${var.env}-infra-app-key"
        Environment = var.env
    }
}

# default vpc
resource aws_default_vpc default_infra_vpc {

}

# security group for vpc
resource aws_security_group my_security_group{
    name = "${var.env}-infra-app-sg"
    vpc_id = aws_default_vpc.default_infra_vpc.id 

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
        protocol    = "-1"            
        cidr_blocks = ["0.0.0.0/0"]     
    }

    tags = {
        Name        = "${var.env}-infra-app-sg"
        Environment = var.env
    }

}

# ec2 instance

resource aws_instance my_instance{

    depends_on = [aws_security_group.my_security_group, aws_key_pair.my-key]

    count = var.instance_count
    
    instance_type = var.instance_type
    key_name = aws_key_pair.my-key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    ami =  var.ec2_ami_id

    root_block_device {
        volume_size = var.env == "prd" ? 20 : 10
        volume_type = "gp3"
    }

    tags = {
        Name = "${var.env}-infra-app-instance-${count.index + 1}"
    }
}