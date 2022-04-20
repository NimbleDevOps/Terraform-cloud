resource "azurerm_windows_web_app" "app_as" {
  name                = format("%s-%s", var.rg_name, "as")
  location            = var.rg_location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.plan.id
  https_only          = true

  identity {
    type = "SystemAssigned"
  }
  site_config {
    always_on     = false
    http2_enabled = true
    cors {
      allowed_origins = ["*"]
    }
    application_stack{
      current_stack = "dotnet"
      dotnet_version = "v5.0"
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "APPINSIGHTS_INSTRUMENTATIONKEY"      = data.azurerm_application_insights.app_ai.instrumentation_key
  }
  auth_settings {
    enabled = true
  }
  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }

  tags = merge({
    },
    var.common_tags
  )
}