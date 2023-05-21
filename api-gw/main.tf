data "terraform_remote_state" "route53" {
  backend = "s3"

  config = {
    bucket = var.remote_bucket
    key    = var.remote_state_r53_key
    region = var.aws_region
  }
}

data "terraform_remote_state" "certificate" {
  backend = "s3"

  config = {
    bucket = var.remote_bucket
    key    = var.remote_state_cert_key
    region = var.aws_region
  }
}
