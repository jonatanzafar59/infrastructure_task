resource "aws_s3_bucket" "main" {
  bucket_prefix = "${lower(var.environment)}-${lower(var.name)}-"

  tags {
    Terraform      = "True"
  }
}
