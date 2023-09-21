output "public_1a" {
  description = "Public IPs for instances in availability zone 1a"
  value       = aws_instance.liorm-EC2-1a[*].public_ip
}

output "public_1b" {
  description = "Public IPs for instances in availability zone 1b"
  value       = aws_instance.liorm-EC2-1b[*].public_ip
}

output "load_balancer_dns" {
  description = "DNS Name for Load Balancer"
  value = aws_lb.liorm-TF.dns_name
}