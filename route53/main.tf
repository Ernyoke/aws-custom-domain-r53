resource "aws_route53_zone" "public_zone" {
  name = var.custom_domain_name
}