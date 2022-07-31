is_production         = false
cluster               = "mts-dev"
service               = "mts-api"
r53_zone              = "mts.escape30.com"
r53_endpoint          = "api.mts.escape30.com"
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
rds = {
  engine               = "postgres"
  engine_version       = "12.10"
  instance_class       = "db.t3.micro"
  username             = "mts"
  password             = "mtstest2022"
  parameter_group_name = "default.postgres12"
  db_name              = "mts_dev_mts_api"
}
environment_variables = {
  node_env = "development"
  debug = "mts-api:*"
}
