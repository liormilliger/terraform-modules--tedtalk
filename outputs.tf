output "public_ips-1a" {
  description = "Public IPs of us-east-1a"
  value       = module.compute.public_1a
}

output "public_ips-1b" {
  description = "Public IPs of us-east-1b"
  value       = module.compute.public_1b
}

output "LB-EndPoint" {
  description = "Load Balancer End Point"
  value       = module.compute.load_balancer_dns
}

