variable "rg_name" {
  description = "Name of the resource group"
}
variable "rg_location" {
  description = "Location of the resource group"
}
variable "common_tags" {
  type        = map(string)
  description = "Map of the mandatory standard tags"
}
variable "os_type" {
  description = "Operating system of the app service plan"
}
variable "sku_name" {
  description = "SKU of the app service plan"
}