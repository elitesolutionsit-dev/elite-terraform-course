variable "path_to_publickey" {
  type    = string
  default = "linuxserverkey.pub"
}

variable "windowssecret" {}

variable "statestorage" {
  type    = string
  default = "elite_devstate"
}

variable "statestorage_account" {
  type    = string
  default = "elitedevstorage"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_name" {
  type = string
}