resource "azurerm_api_management" "apim" {
  name                = local.apim_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  publisher_name      = "Personal"
  publisher_email     = "personal@terraform.io"
  sku_name            = var.sku_name
  tags = merge({
    },
    var.common_tags
  )
  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
    XML
  }
}