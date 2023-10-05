# General Deployment Variables
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "AWS profile which used for terraform infra deployment"
}

variable "env" {
  type        = string
  description = "The environment of application"
}

variable "tags" {
  type        = map(string)
  description = "The key value pairs we want to apply as tags to the resources contained in this module"
}

# Project Specific Variables

variable "bucket_name_prefix" {
  type        = string
  default     = "s3-website"
  description = "The prefix name of S3 bucket for static website hosting"
}

variable "bucket_name_suffix" {
  type        = string
  default     = "portal.com"
  description = "The suffix name of S3 bucket for static website hosting"
}
