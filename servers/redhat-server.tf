resource "azurerm_network_interface" "labnic" {
  name                = join("-", [local.server, "lab", "nic"])
  location            = local.buildregion
  resource_group_name = azurerm_resource_group.elite_general_resources.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.backendnetwork.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.labpip.id
  }
}

resource "azurerm_public_ip" "labpip" {
  name                = join("-", [local.server, "lab", "pip"])
  resource_group_name = azurerm_resource_group.elite_general_resources.name
  location            = local.buildregion
  allocation_method   = "Static"

  tags = local.common_tags
}


resource "azurerm_linux_virtual_machine" "Linuxvm" {
  name                = join("-", [local.server, "linux", "vm"])
  resource_group_name = azurerm_resource_group.elite_general_resources.name
  location            = local.buildregion
  size                = "Standard_DS1"
  admin_username      = "adminuser"
#   user_data           = data.cloudinit_config.userdata.rendered
  network_interface_ids = [
    azurerm_network_interface.labnic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDiE9a7Gprez5sXNcm62CtTtr34zpU3kFFz4lVq8MHYZf9nvRa9N2Rtr6V6UkiU/SUqrvkjAj2flVbfrzBPQ2x/PNc9rtWNznd6jRbG0BzHARB5b4X4uDtxm022FSQWhPjDWFy2p4k2EhHWMTHQkESvxlXrvoM1lMmgOTaqHPGQdD3gYZuSFI8GTdRa7Um798FaM6iDTJi2NHvTK2NpFt0stxdcxt1WGJbN3B/D9p6UM5gJz2+4NC/j4YLJJV3x4eaF05RgEzbZfvmBF6KQNDXQPKCHjTaSk4W7jEnF1K6akGPw9U0uns4FRCVWVzz2wDCQML1ykRdxKVQVN6CZbMKo0tVWz9u3vkOkBZ1OF5gXhhfgrlke7930Tur3JMYHg6zAB4r03YH54mCvw2m/fBfnaZbnmFjOk2ZxZa/MMFVmb1Rkc3UuyaVQTlhPrs2oBLVjhgX42m5JvyP8pV7mNX1FWCkt+CD3jc3L7kZ+izyitd6rhSywk9i7rTB5Ab0RFP8= lbena@LAPTOP-QB0DU4OG"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    offer     = "RHEL"
    publisher = "RedHat"
    sku       = "8-gen2"
    version   = "latest"
  }
}

# -------------------------------------------- #
resource "azurerm_network_interface" "labnic2" {
  name                = join("-", [local.server, "lab", "nic2"])
  location            = local.buildregion
  resource_group_name = azurerm_resource_group.elite_general_resources.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.backendnetwork.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.labpip.id
  }
}

resource "azurerm_public_ip" "labpip2" {
  name                = join("-", [local.server, "lab", "pip2"])
  resource_group_name = azurerm_resource_group.elite_general_resources.name
  location            = local.buildregion
  allocation_method   = "Static"

  tags = local.common_tags
}


resource "azurerm_linux_virtual_machine" "Linuxvm2" {
  name                = join("-", [local.server, "linux", "vm2"])
  resource_group_name = azurerm_resource_group.elite_general_resources.name
  location            = local.buildregion
  size                = "Standard_DS1"
  admin_username      = "adminuser"
#   user_data           = data.cloudinit_config.userdata.rendered
  network_interface_ids = [
    azurerm_network_interface.labnic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDiE9a7Gprez5sXNcm62CtTtr34zpU3kFFz4lVq8MHYZf9nvRa9N2Rtr6V6UkiU/SUqrvkjAj2flVbfrzBPQ2x/PNc9rtWNznd6jRbG0BzHARB5b4X4uDtxm022FSQWhPjDWFy2p4k2EhHWMTHQkESvxlXrvoM1lMmgOTaqHPGQdD3gYZuSFI8GTdRa7Um798FaM6iDTJi2NHvTK2NpFt0stxdcxt1WGJbN3B/D9p6UM5gJz2+4NC/j4YLJJV3x4eaF05RgEzbZfvmBF6KQNDXQPKCHjTaSk4W7jEnF1K6akGPw9U0uns4FRCVWVzz2wDCQML1ykRdxKVQVN6CZbMKo0tVWz9u3vkOkBZ1OF5gXhhfgrlke7930Tur3JMYHg6zAB4r03YH54mCvw2m/fBfnaZbnmFjOk2ZxZa/MMFVmb1Rkc3UuyaVQTlhPrs2oBLVjhgX42m5JvyP8pV7mNX1FWCkt+CD3jc3L7kZ+izyitd6rhSywk9i7rTB5Ab0RFP8= lbena@LAPTOP-QB0DU4OG"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    offer     = "RHEL"
    publisher = "RedHat"
    sku       = "8-gen2"
    version   = "latest"
  }
}