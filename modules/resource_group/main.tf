# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags = merge({
    },
    var.common_tags
  )
}