terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "6.52.0"
        }
    }

    # TODO: backend needs to be configured for remote state management
    
}
