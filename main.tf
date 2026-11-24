resource "aws_s3_bucket" "gitops" {
  bucket = "${var.project_name}-590507089733"

  tags = {
    Name        = "${var.project_name}-bucket"
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "gitops" {
  bucket = aws_s3_bucket.gitops.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "gitops" {
  bucket = aws_s3_bucket.gitops.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "gitops" {
  bucket = aws_s3_bucket.gitops.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
