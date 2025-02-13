resource "aws_instance" "good1" {
  ami             = local.ami
  instance_type   = local.instance_type
  key_name        = local.key_name
  security_groups = [aws_security_group.good1.name]
  tags = {
    CloudCustodianDemo = "true"
    Owner              = "fred.smith@example.com"
    CostCenter         = "Accounting"
  }
}

resource "aws_instance" "good2" {
  ami           = local.ami
  instance_type = local.instance_type
  key_name      = local.key_name
  tags = {
    CloudCustodianDemo = "true"
    Owner              = "jane.fredriksen@example.com"
    CostCenter         = "Product"
  }
}


resource "aws_instance" "bad1" {
  ami           = local.ami
  instance_type = local.instance_type
  key_name      = local.key_name
  tags = {
    CloudCustodianDemo = "true"
  }
}


resource "aws_instance" "bad2" {
  ami           = local.ami
  instance_type = local.instance_type
  key_name      = local.key_name
  tags = {
    CloudCustodianDemo = "true"
    Owner              = "jane.fredriksen@example.com"
  }
}
