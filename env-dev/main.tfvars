env = "dev"
bastion_cidr="172.31.18.76/32"
default_vpc_id="vpc-04a46895be44933a1"
default_vpc_cidr="172.31.0.0/16"
default_vpc_rtid="rtb-0ae3afa267f2eea8a"
kms_arn = "arn:aws:kms:us-east-1:043742147815:key/7a057889-68f1-4f4c-a3cb-4e0bfc8737c9"

vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    subnets = {
      public = {
        name = "public"
        cidr_block = ["10.0.0.0/24", "10.0.1.0/24"]
        azs = ["us-east-1a","us-east-1b"]
      }
      web = {
        name = "web"
        cidr_block = ["10.0.2.0/24", "10.0.3.0/24"]
        azs = ["us-east-1a","us-east-1b"]
      }
      app = {
        name = "app"
        cidr_block = ["10.0.4.0/24", "10.0.5.0/24"]
        azs = ["us-east-1a","us-east-1b"]
      }
      db = {
        name = "db"
        cidr_block = ["10.0.6.0/24", "10.0.7.0/24"]
        azs = ["us-east-1a","us-east-1b"]
      }
    }
  }
}

app = {
  frontend = {
    name = "frontend"
    instance_type = "t3.small"
    subnet_name = "web"
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    allow_app_cidr="public"
  }
  catalogue = {
    name = "catalogue"
    instance_type = "t3.small"
    subnet_name = "app"
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    allow_app_cidr="web"
  }
  cart = {
    name = "cart"
    instance_type = "t3.small"
    subnet_name = "app"
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    allow_app_cidr="web"
  }
  user = {
    name = "user"
    instance_type = "t3.small"
    subnet_name = "app"
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    allow_app_cidr="web"
  }
  shipping = {
    name = "shipping"
    instance_type = "t3.small"
    subnet_name = "app"
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    allow_app_cidr="web"
  }
  payment = {
    name = "payment"
    instance_type = "t3.small"
    subnet_name = "app"
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    allow_app_cidr="web"
  }
  dispatch = {
    name = "dispatch"
    instance_type = "t3.small"
    subnet_name = "app"
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    allow_app_cidr="web"
  }
}

docdb = {
  main = {
    subnet_name = "db"
    allow_db_cidr = "app"
    engine_version = "4.0.0"
  }
}