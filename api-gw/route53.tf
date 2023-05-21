resource "aws_route53_record" "record" {
  name    = var.custom_domain_name
  type    = "A"
  zone_id = data.terraform_remote_state.route53.outputs.dns_zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.custom_domain_name.regional_domain_name
    zone_id                = aws_api_gateway_domain_name.custom_domain_name.regional_zone_id
  }
}