resource "aws_cloudwatch_log_group" "backend_api" {
  name              = "/ecs/backend-api"
  retention_in_days = 7
}
