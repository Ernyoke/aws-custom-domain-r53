variable "environment" {
  default = "dev"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "remote_state_key" {
  default = "aws-custom-domain-demo/route53"
}

variable "remote_bucket" {
  default = "tf-demo-states-1234"
}

variable "custom_domain_name" {
  default = "ervinszilagyi.xyz"
}