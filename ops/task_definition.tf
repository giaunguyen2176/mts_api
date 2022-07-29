resource "aws_ecs_task_definition" "mts" {
  family = "mts"
  container_definitions = jsonencode([
    {
      name      = "mts_api"
      image     = "ghcr.io/giaunguyen2176/mts_api:latest"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}
