# Region
variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-west-1"
}

# VPC CIDR
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Number of availability zones (used for subnet creation)
variable "az_count" {
  description = "Number of availability zones to use"
  type        = number
  default     = 2
}

# Public subnet CIDR blocks (automatically generated if using index math)
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

# Application port (container + ALB listener)
variable "app_port" {
  description = "Port the app container and ALB should expose"
  type        = number
  default     = 80
}

# ECS task CPU units
variable "ecs_cpu" {
  description = "Fargate task CPU units"
  type        = string
  default     = "256"
}

# ECS task memory
variable "ecs_memory" {
  description = "Fargate task memory in MB"
  type        = string
  default     = "512"
}

# ECR Image URI
variable "ecr_image_uri" {
  description = "Full image URI for backend container"
  type        = string
}

# Callback URL for Cognito Hosted UI
variable "cognito_callback_url" {
  description = "Frontend callback URL after Cognito login"
  type        = string
  default     = "https://your-frontend-url.com/callback"
}

# Logout URL for Cognito Hosted UI
variable "cognito_logout_url" {
  description = "Frontend logout URL after Cognito logout"
  type        = string
  default     = "https://your-frontend-url.com/logout"
}
 #ima
 variable "image" {
    description = "Docker image for the backend service"
    type        = string
    default     = "061051261331.dkr.ecr.us-west-1.amazonaws.com/backend-api:latest"
 }