data "azurerm_application_insights" "app_ai" {
  name                = format("%s-%s", var.rg_name, "ai")
  resource_group_name = var.rg_name
}