module "vpc" {
  source = "git::https://github.com/Akhileshreddy9181/tf-module-vpc"
  env = var.env
  tags = var.tags

  for_each = var.vpc
  vpc_cidr = each.value["vpc_cidr"]


}