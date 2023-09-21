output "public_1a" {
  description = "Public IPs for instances in availability zone 1a"
  value       = aws_instance.liorm-TED[*].public_ip
}
