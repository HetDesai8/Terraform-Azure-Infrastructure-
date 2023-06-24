module "redis"{
    source="./modules"
    # redis_server_settings={
    #     redis_cache1 = {
    #         capacity                      = "3"
    #         sku_name                      = "Basic"
    #         enable_non_ssl_port           = "false"
    #         minimum_tls_version           = "1.0"
    #     },
    #     redis_cache2 = {
    #         capacity                      = "3"
    #         sku_name                      = "Basic"
    #         enable_non_ssl_port           = "false"
    #         minimum_tls_version           = "1.0"
    #     }
    # }
}