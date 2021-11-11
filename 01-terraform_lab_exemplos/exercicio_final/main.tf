provider "aws" {
    region = "sa-east-1"  
}

module "criar_instancia" {
  source = "./modulo1"
  nome = "ec2_terraform_modulo-lucasbrito"
}