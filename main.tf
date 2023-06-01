module "vpc" {
        source = "git::https://github.com/jkesarwani123/module-infra-vpc.git"
        for_each = var.vpc
        cidr_block = each.value["cidr_block"]
        subnets = each.value["subnets"]
        tags = local.tags
        env = var.env
}

output "test" {
        value = module.vpc
}

module "app" {
        source   = "git::https://github.com/jkesarwani123/module-infra-app.git"
        for_each = var.app
        instance_type = each.value["instance_type"]
        name = each.value["name"]
        desired_capacity = each.value["desired_capacity"]
        max_size = each.value["max_size"]
        min_size = each.value["min_size"]
        env=var.env
        bastion_cidr=var.bastion_cidr
        tags= local.tags
        vpc_id = lookup(lookup(module.vpc,"main",null),"vpc_id",null)
        subnet_ids = lookup(lookup(lookup(lookup(module.vpc,"main",null),"subnets",null),each.value["subnet_name"],null), "subnet_ids", null)
        allow_app_cidr=lookup(lookup(lookup(lookup(module.vpc,"main",null),"subnets",null),each.value["allow_app_cidr"],null), "subnet_cidrs", null)
}