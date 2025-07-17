resource "aws_cognito_user_pool" "main" {
  name = "admin-ui-user-pool"

  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_numbers   = true
    require_symbols   = false
  }

  username_attributes = ["email"]
}

resource "aws_cognito_user_pool_client" "main" {
  name            = "admin-ui-app-client"
  user_pool_id    = aws_cognito_user_pool.main.id
  generate_secret = false

  allowed_oauth_flows = ["code"]
  allowed_oauth_scopes = ["openid", "email"]
  supported_identity_providers = ["COGNITO"]

  callback_urls = ["https://your-frontend-url.com/callback"]
  logout_urls   = ["https://your-frontend-url.com/logout"]
  allowed_oauth_flows_user_pool_client = true
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = "admin-ui-auth-${random_id.suffix.hex}"
  user_pool_id = aws_cognito_user_pool.main.id
}
