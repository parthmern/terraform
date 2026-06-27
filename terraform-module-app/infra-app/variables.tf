variable "env" {
  type        = string
  description = "Environment of my infra (dev, stg, prd)"

  validation { 
    condition     = contains(["dev", "stg", "prd"], var.env)
    error_message = "Environment must be one of: dev | stg | prd."
  }
}

variable "bucket_name"{
    type = string
    description = "Name of the remote S3 bucket"
}

variable "instance_count"{
    type = number
    default = 1
    description = "Number of EC2 instances to create"
}

variable "instance_type"{
    type = string
    description = "Type of EC2 instance to create"
}

variable "ec2_ami_id"{
    type = string
    description = "AMI ID for the EC2 instance"
}

variable "hash_key"{
    type = string
    description = "Hash key for the DynamoDB table"
    default = "LockID"
}