
resource "aws_vpc" "vpc-tf" {
  cidr_block = "10.60.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "terraform_vpc_lucasbrito"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc-tf.id
  cidr_block        = "10.60.16.0/16"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet1-tf-lucasbrito"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.vpc-tf.id
  cidr_block        = "10.60.32.0/16"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet2-tf-lucasbrito"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id            = aws_vpc.vpc-tf.id
  cidr_block        = "10.60.48.0/16"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet3-tf-lucasbrito"
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id            = aws_vpc.vpc-tf.id
  cidr_block        = "10.60.64.0/16"
  availability_zone = "us-east-1c"

  tags = {
    Name = "subnet4-tf-lucasbrito"
  }
}


resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "ig-tf-lucasbrito"
  }
}


resource "aws_route_table" "rt_tf" {
  vpc_id = aws_vpc.my_vpc.id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = aws_internet_gateway.ig.id
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "route_table_terraform"
  }
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt_tf.id
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt_tf.id
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.rt_tf.id
}