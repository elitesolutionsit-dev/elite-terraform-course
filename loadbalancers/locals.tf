locals {
  # Common tags to be assigned to all resources
  appgw_tags = {
    Service     = "devOps"
    Owner       = "elitesolutionsit"
    environment = "Development"
    ManagedWith = "terraform"
  }

  rgappw          = "elite"
  buildregion     = lower("EASTUS2")
  existingvnet    = "elitedev_vnet"
  existingvnetrg  = "elitegeneralnetwork"
  existingnsg     = "elite_devnsg"
  existingrtb     = "elite_rtb"
  ipconfname      = "internal"
  ssl_certificate = "elitelabtoolsazure.link"
}