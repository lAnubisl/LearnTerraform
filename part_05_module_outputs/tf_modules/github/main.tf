resource "github_repository_environment" "environment" {
  repository       = "LearnTerraform"
  environment      = var.environment
}

resource "github_actions_environment_secret" "website_deployment_key" {
  repository       = github_repository_environment.environment.repository
  environment      = var.environment
  secret_name      = "WEBSITE_DEPLOYMENT_KEY"
  plaintext_value  = var.website_deployment_key
}

resource "github_actions_environment_secret" "function_deployment_user" {
  repository       = github_repository_environment.environment.repository
  environment      = var.environment
  secret_name      = "FUNCTION_DEPLOYMENT_USER"
  plaintext_value  = var.function_deployment_user
}

resource "github_actions_environment_secret" "function_deployment_password" {
  repository       = github_repository_environment.environment.repository
  environment      = var.environment
  secret_name      = "FUNCTION_DEPLOYMENT_PASSWORD"
  plaintext_value  = var.function_deployment_password
}