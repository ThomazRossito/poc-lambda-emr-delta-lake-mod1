resource "aws_s3_bucket" "buckets" {
  count  = length(var.bucket_names)
  bucket = "${var.prefix_name}-${var.bucket_names[count.index]}-${var.account_id}"

  force_destroy = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "server_side_encryption" {
  count  = length(var.bucket_names)
  bucket = "${var.prefix_name}-${var.bucket_names[count.index]}-${var.account_id}"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
      #               "aws:kms"
    }
    bucket_key_enabled = true
  }
  depends_on = [
    aws_s3_bucket.buckets
  ]
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  count  = length(var.bucket_names)
  bucket = "${var.prefix_name}-${var.bucket_names[count.index]}-${var.account_id}"
  acl    = "private"

  depends_on = [
    aws_s3_bucket.buckets
  ]
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  count  = length(var.bucket_names)
  bucket = "${var.prefix_name}-${var.bucket_names[count.index]}-${var.account_id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.buckets
  ]
}
