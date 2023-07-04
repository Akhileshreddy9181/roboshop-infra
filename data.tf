data "aws_ssm_parameter" "ssh_pass" {
  name = "${var.env}.ssh.pass"
}

data "aws_ami" "ami" {
  most_recent = true
  name_regex = "devops-practice-with-ansible"
  owners = ["self"]
}

data "aws_security_group" "default_secgrp_id" {
  id = var.default_vpc_id
}