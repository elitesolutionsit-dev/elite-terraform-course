locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service     = "devOps"
    Owner       = "elitesolutionsit"
    environment = "Development"
    ManagedWith = "terraform"
  }
  server         = "elite"
  buildregion    = lower("EASTUS2")
  existingvnet   = "elitedev_vnet"
  existingvnetrg = "elite_general_network"
  existingnsg    = "elite_devnsg"
}