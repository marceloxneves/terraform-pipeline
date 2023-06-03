variable "location" {
  description = "Indica a região onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "owner" {
  type      = string
  default   = "marceloxneves"
  sensitive = true
}

variable "aws_pub_key" {
  description = "Public key para VM AWS"
  type = string
}