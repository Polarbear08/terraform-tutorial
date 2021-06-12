variable "instance_name" {
  description = "Value of the Name tag for an EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance!"
}

output "instance_public_ip" {
  description = "Public IP address of an EC2 instance"
  value       = aws_instance.app_server.public_ip
}