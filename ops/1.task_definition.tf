resource "aws_ecs_task_definition" task_definition {
  family = "${var.name}-api"
  requires_compatibilities  = ["FARGATE"]
  cpu                       = tonumber(var.task_definition.cpu)
  memory                    = tonumber(var.task_definition.memory)
  execution_role_arn        = aws_iam_role.ecs_task_execution_role.arn
  network_mode              = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = var.containers["api"].name
      image     = var.containers["api"].image
      cpu       = tonumber(var.containers["api"].cpu)
      memory    = tonumber(var.containers["api"].memory)
      essential = true
      portMappings = [
        {
          containerPort = tonumber(var.containers["api"].container_port)
          hostPort      = tonumber(var.containers["api"].host_port)
        }
      ]
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-group = "backend",
          awslogs-region = "ap-southeast-1",
          awslogs-create-group = "true",
          awslogs-stream-prefix = "api"
        }
      },
      command = [
        "npm",
        "start"
      ],
      environment = [
        {
          name = "DEBUG",
          value = var.environment_variables.debug
        },
        {
          name = "NODE_ENV",
          value = var.environment_variables.node_env
        },
      ]
    }
  ])
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.name}-ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
        Effect = "Allow",
        Sid = ""
      }
    ]
  })
}

resource "aws_iam_policy" "cloudwatch" {
  name        = "${var.name}-task-policy-cloudwatch"
  description = "Policy that allows access to cloudwatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment1" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment2" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.cloudwatch.arn
}
