terraform {
  required_version = "0.12.4"
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_s3_bucket" "k8s_tf_state" {
  bucket = "suman-mukherjee-k8s-tf-state"
  acl    = "private"

  tags = {
    managed_by = "terraform"
  }
}

resource "aws_dynamodb_table" "k8s_tf_state_locks" {
  name           = "k8s_tf_state_locks"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    managed_by = "terraform"
  }
}
