resource "azurerm_storage_account" "st_func" {
  name                            = local.func_storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
}

resource "azurerm_service_plan" "func_plan" {
  name                = local.func_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.function_sku
}

resource "azurerm_linux_function_app" "func" {
  name                       = local.func_app_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  service_plan_id            = azurerm_service_plan.func_plan.id
  storage_account_name       = azurerm_storage_account.st_func.name
  storage_account_access_key = azurerm_storage_account.st_func.primary_access_key
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = "dotnet-isolated" # https://learn.microsoft.com/en-us/azure/azure-functions/dotnet-isolated-process-guide
    SCM_DO_BUILD_DURING_DEPLOYMENT = "false" # set to false to disable build during deployment. Do not set it to true. It will cause deployment to fail.
  }
  site_config {
    application_stack {
      dotnet_version              = "6.0"
      use_dotnet_isolated_runtime = true
    }
  }
}