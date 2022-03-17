resource "azurerm_resource_group" "example" {
    name     = "resource2"
    location = "South Central US"
}

resource "azurerm_storage_account" "example" {
    name                     = "test14account"
    resource_group_name      = azurerm_resource_group.example.name 
    location                 = azurerm_resource_group.example.location
    account_tier             = "Standard"
    account_replication_type = "LRS" 
}

resource "azurerm_storage_container" "example" {
    name                   =  "secretfiles"
    storage_account_name   =  azurerm_storage_account.example.name
    container_access_type  =  "private"
 }

 resource "azurerm_storage_blob" "example" {
     name                     = "main2.tf"
     storage_account_name     = azurerm_storage_account.example.name
     storage_container_name   = azurerm_storage_container.example.name
     type                     = "Block"
     source                   = "C:/Users/rkira/Code/main2.tf"
 }