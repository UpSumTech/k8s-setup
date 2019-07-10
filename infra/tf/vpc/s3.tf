resource "aws_s3_bucket" "kops_state" {
  bucket        = "${local.cluster}-kops-state"
  acl           = "private"
  force_destroy = true

  tags = {
    managed_by = "terraform"
  }
}
