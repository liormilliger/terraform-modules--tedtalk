resource "aws_s3_bucket" "liorm-test-bucket" {
  bucket = "liorm-test-bucket"
  
  # lifecycle {
  #   prevent_destroy = true
  # }
  
}
resource "aws_s3_bucket_ownership_controls" "liorm-ownership" {
  bucket = aws_s3_bucket.liorm-test-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "liorm-TF" {
  bucket = aws_s3_bucket.liorm-test-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "liorm-TF" {
  bucket = aws_s3_bucket.liorm-test-bucket.id
  versioning_configuration {
  status = "Enabled"
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.liorm-test-bucket.id
  key    = "data/terraform.tfstate"
}

# resource "aws_dynamodb_table" "liorm-lockstate" {
#   name           = "liorm-lockstate"
#   hash_key       = "LockId"
#   range_key      = "lock-state"

#   attribute {
#     name = "LockId"
#     type = "S"
#   }
# }