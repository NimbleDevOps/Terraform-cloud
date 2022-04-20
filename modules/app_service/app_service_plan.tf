resource "azurerm_service_plan" "plan" {
  name                = format("%s-%s", var.rg_name, "asp")
  location            = var.rg_location
  resource_group_name = var.rg_name
  os_type             = var.os_type
  sku_name            = var.sku_name

  tags = merge({
    },
    var.common_tags
  )
}