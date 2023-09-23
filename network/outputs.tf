output "VPC_ID" {
  description = "VPC id for liorm-TF-easy-vpc"
  value       = aws_vpc.liorm-TED.id
}

output "SG" {
  description = "Security Group"
  value = aws_security_group.liorm-TED-SG.id
}

output "subnets_1a" {
  description = "Subnets Availability Zones"
  value = aws_subnet.us-east-1a.id
}

# output "bucket_acl" {
#   description = "bucket ACL exposed"
#   value = aws_s3_bucket_acl.liorm-TF.id
# }

# output "public_key_content" {
#   description = "public key for instance"
#   value = aws_key_pair.liorm-ted-key.public_key
# }
