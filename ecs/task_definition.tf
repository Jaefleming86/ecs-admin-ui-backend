resource "aws_ecs_task_definition" "backend" {
  family                   = "backend-api-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256" # adjust if needed
  memory                   = "512" # adjust if needed
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "backend-api"
      image     = "061051261331.dkr.ecr.us-west-1.amazonaws.com/backend-api:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/backend-api"
          awslogs-region        = "us-west-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}
