variable project_id {
    type        = string
    description = "Google cloud project id"
}

variable credential_file {
    type        = string 
    description = "Credential file to connect to GCP and perform operations"
}

variable default_region {
    type        = string
    description = "Default GCP region"
}

variable default_zone {
    type        = string
    description = "Default GCP Zone"
}

variable cluster {
    type        = object({
        zone                = string
        name                = string
        description         = string
        version             = string
        node_count          = number
        node_config         =  object(
                                {
                                    disk_size       = string
                                    disk_type       = string
                                    image_type      = string
                                    machine_type    = string
                                    version         = string
                                })
        min_node_count      = number
        max_node_count      = number
    })
    description = "Cluster configuration"
}
