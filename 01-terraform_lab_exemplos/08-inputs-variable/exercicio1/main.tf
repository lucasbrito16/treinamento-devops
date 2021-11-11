provider "aws" {
    region = "sa-east-1"
}

variable "subnet_id" {
  type        = string
  description = "Digite o ID da subnet: "

  validation {
    condition     = length(var.subnet_id) > 7 && substr(var.subnet_id, 0, 7) == "subnet-"
    error_message = "O valor do subnet_id não é válido, ele deve começar com \"subnet-\"."
  }
}

variable "ami" {
  type        = string
  description = "Digite a AMI: "

validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "O valor do subnet_id não é válido, ele deve começar com \"ami-\"."
  }
}

variable "instance_type" {
  type        = string
  description = "Digite o tipo de instância: "

validation {
    condition     = length(var.instance_type) > 3 && substr(var.instance_type, 0, 3) == "t2."
    error_message = "O tipo da instância não é válido, ele deve ser do tipo \"t2.\"."
  }
}

variable "vpc_security_group_id" {
  type        = string
  description = "Digite ID do Security Group: "

validation {
    condition     = length(var.vpc_security_group_id) > 3 && substr(var.vpc_security_group_id, 0, 3) == "sg-"
    error_message = "O valor do Security Group não é válido, ele deve começar com \"sg-\"."
  }
}

resource "aws_instance" "web" {
  subnet_id     = var.subnet_id
  ami= var.ami
  associate_public_ip_address = true
  instance_type = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_id]
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-lucasbrito-tf-exercicio1"
  }
}

output "parametros_maquina" {
  value = [aws_instance.web.public_dns, 
  aws_instance.web.subnet_id,
  aws_instance.web.ami,
  aws_instance.web.instance_type,
  aws_instance.web.vpc_security_group_ids]
  description = "Mostra os dados da máquina criada."
}
