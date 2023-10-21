output "azure_function_app_deployment_user" {
  value = azurerm_linux_function_app.func.site_credential[0].name
}

output "azure_function_app_deployment_password" {
  value = azurerm_linux_function_app.func.site_credential[0].password
}