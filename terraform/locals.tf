locals {
  bucket_name = var.env != "prod" ? "${var.static_bucket_name}.${var.env}" : "${var.static_bucket_name}"
}
