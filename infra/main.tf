resource "azurerm_resource_group" "demo" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "plan" {

  name                = "asp-angular-demo"

  location            = azurerm_resource_group.demo.location

  resource_group_name = azurerm_resource_group.demo.name

  os_type  = "Linux"

  sku_name = "B1"

}

resource "azurerm_linux_web_app" "webapp" {

  name                = "angular-demo-gautam"

  location            = azurerm_resource_group.demo.location

  resource_group_name = azurerm_resource_group.demo.name

  service_plan_id = azurerm_service_plan.plan.id

  site_config {

    application_stack {

      node_version = "22-lts"

    }

  }

}