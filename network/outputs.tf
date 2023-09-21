output "VPC_ID" {
  description = "VPC id for liorm-TF-easy-vpc"
  value       = aws_vpc.liorm-TF.id
}

output "SG" {
  description = "Security Group"
  value = aws_security_group.liorm-TF-SG.id
}

output "subnets_1a" {
  description = "Subnets Availability Zones"
  value = aws_subnet.liorm-us-east-1a.id
}

output "subnets_1b" {
  description = "Subnets Availability Zones"
  value = aws_subnet.liorm-us-east-1b.id
}

output "bucket_acl" {
  description = "bucket ACL exposed"
  value = aws_s3_bucket_acl.liorm-TF.id
}

# output "subnets_azs" {
#   description = "Subnets Availability Zones"
#   value = aws_subnet.liorm-us-east-1b.*.availability_zone
# }

