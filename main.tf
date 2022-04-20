# Environment Variables
module "env_vars" {
  source      = "./modules/env_vars"
  environment = var.environment
  team        = var.team
}
# Create a resource group
module "resource_group" {
  source      = "./modules/resource_group"
  name        = var.resource_group_name
  location    = var.location
  common_tags = module.env_vars.common_tags
}
module "app_insights" {
  source      = "./modules/app_insights"
  rg_name     = var.resource_group_name
  rg_location = var.location
  common_tags = module.env_vars.common_tags
  depends_on  = [module.resource_group]
}
module "app_service" {
  source      = "./modules/app_service"
  rg_name     = var.resource_group_name
  rg_location = var.location
  common_tags = module.env_vars.common_tags
  os_type     = "Windows"
  sku_name    = "F1"

  depends_on = [module.resource_group, module.app_insights]
}

module "api_management" {
  source      = "./modules/api_management"
  rg_name     = var.resource_group_name
  rg_location = var.location
  sku_name    = "Consumption_0"
  common_tags = module.env_vars.common_tags
  depends_on  = [module.resource_group]
}