resource "aws_s3_bucket" "remote_s3" {
  bucket = "remote-tf-infra-bucket"

  tags = {
    Name        = "remote-tf-infra-bucket"
  }
}