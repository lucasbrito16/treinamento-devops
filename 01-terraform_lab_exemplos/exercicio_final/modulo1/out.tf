output "parametros_maquina" {
  value = [aws_instance.web.public_dns, 
  aws_instance.web.vpc_security_group_ids,
  "ssh -i \"id_rsa_lucas\" ubuntu@${aws_instance.web.public_dns}"]
  description = "Mostra os dados da máquina criada."
}


/* output name {
  value       = aws_instance.web.public_dns
  description = "DNS da instância"
} */