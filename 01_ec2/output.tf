# output "ec2_public_ip" {
#   value = aws_instance.my_instance[*].public_ip
# }

# output "ec2_public_dns" {
#   value = aws_instance.my_instance[*].public_dns
# }

# output "ec2_arn" {
#   value = aws_instance.my_instance[*].arn
# }

output "ec2_id" {
  value = [
    for instance in aws_instance.my_instance : instance.id
  ]
}