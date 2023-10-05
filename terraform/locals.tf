locals {
  bucket_name = var.env != "prod" ? "${var.bucket_name_prefix}.${var.env}.${var.bucket_name_suffix}" : "${var.bucket_name_prefix}.${var.bucket_name_suffix}"
}
