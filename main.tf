module "vpc" {
        source = "git::https://github.com/jkesarwani123/module-infra-vpc.git"
        for_each = var.vpc
        cidr_block = each.value["cidr_block"]
        subnets = each.value["subnets"]
        tags = local.tags
        env = var.env
}

#output "vpc" {
#        value = module.vpc
#}

module "app" {
        source   = "git::https://github.com/jkesarwani123/module-infra-app.git"
        for_each = var.app
        instance_type = each.value["instance_type"]
        subnet_id = element(lookup(lookup(lookup(module.vpc,"main",null),"name",null), "subnet_ids", null),0)


}