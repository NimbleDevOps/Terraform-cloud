variable "std_tags" {
  type    = map(string)
  default = {}
}
variable "environment" {
  description = "Environment of the system"
}
variable "team" {
  description = "The team responsibible for the service"
}
