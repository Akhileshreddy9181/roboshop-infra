module "vpc" {
  source = "git::https://github.com/Akhileshreddy9181/tf-module-vpc.git"
  env = var.env
  tags = var.tags
  default_route_table = var.default_route_table
  default_vpc_id = var.default_vpc_id

  for_each = var.vpc
  vpc_cidr = each.value["vpc_cidr"]
  public_subnets = each.value["public_subnets"]
  private_subnets = each.value["private_subnets"]


}

#module "docdb" {
#  source = "git::https://github.com/Akhileshreddy9181/tf-module-docdb.git"
#  env = var.env
#  tags = var.tags
#
#  for_each = var.docdb
#  engine = each.value["engine"]
#  backup_retention_period = each.value["backup_retention_period"]
#  preferred_backup_window = each.value["preferred_backup_window"]
#  skip_final_snapshot = each.value["skip_final_snapshot"]
#  engine_version = each.value["engine_version"]
#  subnet_ids = local.db_subnet_ids
#  no_of_instances = each.value["no_of_instances"]
#  instance_class = each.value["instance_class"]
#
#}
#
#module "rds" {
#  source = "git::https://github.com/Akhileshreddy9181/tf-module-rds.git"
#  env = var.env
#  tags = var.tags
#  subnet_ids = local.db_subnet_ids
#
#  for_each = var.rds
#  engine = each.value["engine"]
#  backup_retention_period = each.value["backup_retention_period"]
#  preferred_backup_window = each.value["preferred_backup_window"]
#  skip_final_snapshot = each.value["skip_final_snapshot"]
#  engine_version = each.value["engine_version"]
#  instance_class = each.value["instance_class"]
#  no_of_instances = each.value["no_of_instances"]
#
#
#}
#
#module "elasticache" {
#  source = "git::https://github.com/Akhileshreddy9181/tf-module-elasticache.git"
#  env = var.env
#  tags = var.tags
#  subnet_ids = local.db_subnet_ids
#
#  for_each = var.elasticache
#  engine = each.value["engine"]
#  engine_version = each.value["engine_version"]
#  num_cache_nodes = each.value["num_cache_nodes"]
#  node_type = each.value["node_type"]
#
#
#
#
#}
#
#module "rabbitmq" {
#  source = "git::https://github.com/Akhileshreddy9181/tf-module-rabbitmq.git"
#  env = var.env
#  tags = var.tags
#  subnet_ids = local.db_subnet_ids
#
#  for_each = var.rabbitmq
#  instance_type = each.value["instance_type"]
#
#
#
#
#}

module "alb" {
  source = "git::https://github.com/Akhileshreddy9181/tf-module-alb.git"
  env = var.env
  tags = var.tags
  vpc_id = module.vpc["main"].vpc_id

  for_each =  var.alb
  internal = each.value["internal"]
  name = each.value["name"]
  load_balancer_type = each.value["load_balancer_type"]
  subnets = lookup(local.subnet_ids, each.value["subnet_name"], null)
  allow_cidr = each.value["allow_cidr"]

}

module "app" {
  source = "git::https://github.com/Akhileshreddy9181/tf-module-app.git"
  env = var.env
  tags = var.tags
  bastion_cidr = var.bastion_cidr
  dns_domain = var.dns_domain

  vpc_id = module.vpc["main"].vpc_id

  for_each =  var.apps
  component = each.value["component"]
  instance_type = each.value["instance_type"]
  desired_capacity   = each.value["desired_capacity"]
  max_size           = each.value["max_size"]
  min_size           = each.value["min_size"]
  subnets = lookup(local.subnet_ids, each.value["subnet_name"], null)
  port = each.value["port"]
  allow_app_to  = lookup(local.subnet_cidr, each.value["allow_app_to"], null)
  alb_dns_name = lookup(module.alb, "main", null )
  //alb_dns_name = lookup(lookup(lookup(module.alb, each.value["alb"], null), "alb", null), "dns_name", null)

}

output "alb" {
  value = module.alb
}