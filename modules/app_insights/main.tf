resource "azurerm_application_insights" "app_ai" {
  name                = format("%s-%s", var.rg_name, "ai")
  location            = var.rg_location
  resource_group_name = var.rg_name
  application_type    = "web"

  tags = merge({
    format("%s%s%s%s%s%s%s", "hidden-link:/subscriptions/", data.azurerm_client_config.current.subscription_id, "/resourceGroups/", var.rg_name, "/providers/Microsoft.Web/sites/", var.rg_name, "-as") = "Resource"
    },
    var.common_tags
  )
}