variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  description = "List of public subnets"
}

variable "private_subnets" {
  description = "List of private subnets"
}

variable "availability_zones" {
  description = "List of availability zones"
}

variable "alb_tls_cert" {
  description = "SSL certificate"
}

variable "task_definition" {
  type = object({
    memory = number
    cpu = number
  })
}

variable "containers" {
  description = "The object describe all containers"
  type = map(object({
    name = string
    container_port = string
    host_port = string
    image = string
    memory = number
    cpu = number
  }))
}

variable "environment_variables" {
  description = "The object describe all containers"
  type = object({
    node_env = string
    debug = string
  })
}

