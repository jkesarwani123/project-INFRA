module "vpc" {
        source = "git::https://github.com/jkesarwani123/module-infra-vpc.git"
        for_each = var.vpc
        cidr_block = each.value["cidr_block"]
        subnets = each.value["subnets"]
        azs = each.value["azs"]
        tags = local.tags
        env = var.env
}