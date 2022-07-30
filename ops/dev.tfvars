name                = "mts-dev"
cidr                = "10.0.0.0/16"
private_subnets     = ["10.0.0.0/20", "10.0.32.0/20"]
public_subnets      = ["10.0.16.0/20", "10.0.48.0/20"]
availability_zones  = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
task_definition = {
  memory              = 1024
  cpu                 = 256
}
containers = {
  api = {
    name                = "mts_api"
    container_port      = 3000
    host_port           = 3000
    image               = "ghcr.io/giaunguyen2176/mts_api:latest"
    memory              = 256
    cpu                 = 10
  }
}
alb_tls_cert = "arn:aws:acm:ap-southeast-1:830394630098:certificate/c2eecd9e-d7bb-49c3-a455-33ca104797da"
environment_variables = {
  node_env = "development"
  debug = "mts-api:*"
}
