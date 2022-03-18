module "redis" {
  source      = "git@github.com:hmcts/cnp-module-redis?ref=master"
  product     = var.product
  location    = var.location
  env         = var.env
  subnetid    = ''
  common_tags = var.common_tags
}

data "azurerm_subnet" "redis" {
  name                 = "redis"
  resource_group_name  = "ss-${var.env}-network-rg"
  virtual_network_name = "ss-${var.env}-vnet"
}

resource "azurerm_key_vault_secret" "tt-redis-access-key" {
  name         = "redis-access-key"
  value        = module.redis.access_key
  key_vault_id = module.tt-key-vault.key_vault_id
}

resource "azurerm_key_vault_secret" "tt-redis-host" {
  name         = "redis-host"
  value        = module.redis.host_name
  key_vault_id = module.tt-key-vault.key_vault_id
}

resource "azurerm_key_vault_secret" "tt-redis-port" {
  name         = "redis-port"
  value        = module.redis.redis_port
  key_vault_id = module.tt-key-vault.key_vault_id
}
