locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service     = "devOps"
    Owner       = "elitesolutionsit"
    environment = "Development"
    ManagedWith = "terraform"
  }
  server                  = "elite"
  buildregion             = lower("EASTUS2")
  existingvnet            = "elitedev_vnet"
  existingvnetrg          = "elitegeneralnetwork"
  existingnsg             = "elite_devnsg"
  exisitingkeyvaultsecret = "WINDOWSSERVERPASSWORD"
  existingkeyvault        = join("", ["elitedev", "keyvault", "master"])
  existingkeyvaultrg      = "elitevault"
  admin_username          = "eliteadmin"
  existinglinuxvm         = "elite-linux-vm"
  existinglinuxvmrg       = lower("ELITE_RESOURCES")
}