location             = "East US"
resource_group_name  = "eSignPlusTerraformRG"
storage_account_name = "esignplustfsa"
container_name       = "tfstates"
account_tier         = "Premium"
replication_type     = "LRS" #"GZRS"

tags = {
  environment  = "Prod"
  customer     = "IMM"
  team         = "eSign Cloud IAC"
  businessunit = "Infra"
  costcenter   = "IAC"
  product      = "IMMeSign"
}