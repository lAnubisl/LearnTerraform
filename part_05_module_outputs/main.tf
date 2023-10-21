resource "azurerm_resource_group" "my_resource_group" {
  name     = local.resource_group_name
  location = var.location
}

module "frontend" {
  source                   = "./tf_modules/frontend"
  location                 = azurerm_resource_group.my_resource_group.location
  resource_group_name      = azurerm_resource_group.my_resource_group.name
  environment              = var.environment
}

module "backend" {
  source                   = "./tf_modules/backend"
  location                 = azurerm_resource_group.my_resource_group.location
  resource_group_name      = azurerm_resource_group.my_resource_group.name
  environment              = var.environment
  function_sku             = "Y1" # Y1 is the cheapest pricing tier. 'Y' stands for Dynamic. That means Consumption Plan.
  allowed_origins          = [ module.frontend.default_host_name ]
}

module "github" {
  source                       = "./tf_modules/github"
  environment                  = var.environment
  website_deployment_key       = module.frontend.default_host_name
  function_deployment_user     = module.backend.azure_function_app_deployment_user
  function_deployment_password = module.backend.azure_function_app_deployment_password
}