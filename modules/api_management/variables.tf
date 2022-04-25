variable "rg_name" {
  description = "Name of the resource group"
}
variable "rg_location" {
  description = "Location of the resource group"
}
variable "sku_name" {
  description = "Name of SKU for the API management "
}
variable "common_tags" {
  type        = map(string)
  description = "Map of the mandatory standard tags"
}
locals {
  apim_name = format("%s-%s", var.rg_name, "apim")
}