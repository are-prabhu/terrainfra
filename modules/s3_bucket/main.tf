#-------------------------------------------------------------------------------
# s3.tf - S3 bucket definitions
#-------------------------------------------------------------------------------

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.prefix}-${var.environment}-${var.bucket}"
  region = "${var.aws_region}"

  server_side_encryption_configuration = {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
