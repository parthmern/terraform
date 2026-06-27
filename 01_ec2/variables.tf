variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "The type of instance to create"
}

variable "root_volume_size" {
    type = number
    default = 8
    description = "Size of the root volume in GB"
}

variable "root_volume_type" {
    type = string
    default = "gp2"
    description = "Type of the root volume"
}

variable "env" {
    type = string
    default = "dev"
    description = "Environment (dev, prod, etc.)"
}