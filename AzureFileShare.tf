resource "azurerm_resource_group" "fileshare" {
  name     = "azure22test"
  location = "South Central US"
}

resource "azurerm_storage_account" "fileshare" {
  name                     = "azuretest22storage"
  resource_group_name      = azurerm_resource_group.fileshare.name
  location                 = azurerm_resource_group.fileshare.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "example" {
  name                 = "sharename"
  storage_account_name = azurerm_storage_account.fileshare.name
  quota                = 100

  acl {
    id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"

    access_policy {
      permissions = "rwdl"
      start       = "2019-07-02T09:38:21.0000000Z"
      expiry      = "2019-07-02T10:38:21.0000000Z"
    }
  }
}

resource "azurerm_storage_container" "fileshare" {
    name                   =  "secretfiles"
    storage_account_name   =  azurerm_storage_account.fileshare.name
    container_access_type  =  "private"
 }

 resource "azurerm_storage_blob" "fileshare" {
     name                     = "main2.tf"
     storage_account_name     = azurerm_storage_account.fileshare.name
     storage_container_name   = azurerm_storage_container.fileshare.name
     type                     = "Block"
     source                   = "C:/Users/rkira/Code/main2.tf"
 }