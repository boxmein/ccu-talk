resource "aws_security_group" "bad1" {
  name        = "launch-wizard-12345678"
  description = "demo2 sg launch wizard"
  vpc_id      = local.vpc
  tags = {
    CloudCustodianDemo = "true"
  }
}
