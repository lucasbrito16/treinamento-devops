terraform {
  required_version = ">= 0.12" # colocando compatibilidade do terraform para 0.12
}

resource "aws_instance" "web" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  subnet_id     = "subnet-032a48150450b3ec5"
  associate_public_ip_address = true
  
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  key_name = "keypair-treinamento-itau-turma2-lucasbrito" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  tags = {
    Name = "${var.nome}"
  }
  vpc_security_group_ids = ["sg-01db4004afb042544"]
}

/* output "parametros_maquina" {
  value = [aws_instance.web.public_dns, 
  aws_instance.web.vpc_security_group_ids,
  "ssh -i \"id_rsa_lucas\" ubuntu@${aws_instance.web.public_dns}"]
  description = "Mostra os dados da máquina criada."
} */


/* resource "aws_instance" "web" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  tags = {
    Name = "${var.nome}",
    Itau = true
  }
} */