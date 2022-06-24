locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service     = "devOps"
    Owner       = "elitesolutionsit"
    environment = "Development"
    ManagedWith = "terraform"
  }
  admin_username = "elite"
}