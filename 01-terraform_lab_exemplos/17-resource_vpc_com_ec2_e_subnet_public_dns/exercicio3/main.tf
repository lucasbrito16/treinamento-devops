provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web1" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
  associate_public_ip_address = true
  
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  key_name = "keypair-treinamento-itau-turma2-lucasbrito" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  tags = {
    Name = "Minha Maquina Simples EC2 - Lucas Brito"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

output "parametros_maquina" {
  value = [aws_instance.web.public_dns, 
  aws_instance.web.vpc_security_group_ids,
  "ssh -i \"id_rsa_lucas\" ubuntu@${aws_instance.web.public_dns}"]
  description = "Mostra os dados da máquina criada."
}