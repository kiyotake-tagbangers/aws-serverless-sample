resource "aws_dynamodb_table" "default" {
  name = "DynamoForLambda"
  hash_key = "id"
  billing_mode = "PROVISIONED"
  read_capacity = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "N"
  }
}

resource "aws_dynamodb_table_item" "default" {
  hash_key = aws_dynamodb_table.default.hash_key
  table_name = aws_dynamodb_table.default.name
  item = <<ITEM
{
  "id": {"N": "1001"},
  "name": {"S": "Mike"},
  "Department": {"S": "IT"}
}
ITEM
}