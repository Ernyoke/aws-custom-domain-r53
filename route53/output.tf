output "dns_zone_id" {
  value = aws_route53_zone.public_zone.zone_id
}

output "name_servers" {
  value = aws_route53_zone.public_zone.name_servers
}