output "application_insights_instrumentation_key" {
  value = azurerm_application_insights.app_ai.instrumentation_key
}

output "application_insights_app_id" {
  value = azurerm_application_insights.app_ai.app_id
}