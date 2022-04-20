variable "name" {
  description = "Name of the resource group"
  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^rg-", var.name))
    error_message = "The resource group should be starting with \"rg-\"."
  }
}
variable "location" {
  description = "Location of the resource group"
}
variable "common_tags" {
  type        = map(string)
  description = "Map of the mandatory standard tags"
}