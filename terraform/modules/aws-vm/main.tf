variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

resource "aws_instance" "retail_vm" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2023 us-east-1
  instance_type = "t2.micro"
  
  # Optional: Add key pair if you want SSH access
  # key_name      = "your-key-pair-name"

  tags = {
    Name        = "${var.environment}-retail-vm"
    Environment = var.environment
    Project     = "multi-cloud-retail"
  }
}

output "public_ip" {
  value = aws_instance.retail_vm.public_ip
}

output "instance_id" {
  value = aws_instance.retail_vm.id
}
