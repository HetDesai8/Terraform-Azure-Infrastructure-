variable "resource_group_name" {

    default = "tfstate"
}

variable "location" {

    default = "East US"
  
}

variable "storage_account_name" {

  default = "tfstate643764qap"
}

variable "container_name" {
  
  default = "tfstate"
}

variable "account_tier" {
  
  default = "Standard"
}

variable "replication_type" {
  
  default = "LRS"
}
variable "key" {

  default =  "terraform.tfstate"
  
}

variable "container_access_type" {
  
  default = "private"
}

variable "tags" {
    
    default = {
       environment = "staging"
    }
}

variable "allow_blob_public_access" {
  
    default = "false"
}