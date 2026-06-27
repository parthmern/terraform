resource "aws_dynamodb_table" "remote-dynamodb-table" {
  name           = "remote-dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"     # provisioned(expensive) or pay-per-request(cheap)
  hash_key       = "LockID"             # primary key [LockID]

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "remote-dynamodb-table"
  }
}