output "public_ip" {
  value = aws_instance.MiVm.public_ip
}

output "vm_name" {
  value = aws_instance.MiVm.tags_all
}