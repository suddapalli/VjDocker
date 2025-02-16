output "public_ip" {
  value     = aws_instance.vjec2.private_ip
  ephemeral = false
}