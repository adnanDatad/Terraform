terraform{
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "=2.91.0"
      }
    }
    
}

provider "azurerm"{
  subscription_id= var.subscription_id
  tenant_id = var.tenant_id
  features {}
}

#ADF
resource "azure_rm_data_factory" "adf" {
  name = var.adf_name
  resource_group_name=var.rg_name
}

#ADB
resource "azurerm_databricks_workspace" "adb" {
  name                = var.adb_name
  resource_group_name = var.rg_name
  location            = var.region
  sku                 = var.databricks_sku
}
