project_id      = "tmogoserverless"
credential_file = "~/.gcp/iac-svc-acct.json"
default_region  = "us-west1"
default_zone    = "us-west1-a"
cluster         = {
                        "zone"              = "us-west1-c",
                        "name"              = "ram-gcp-storage-poc",
                        "description"       = "Ram's gke cluster for cloud storage tutorials",
                        "version"           = "1.15.11-gke.9"
                        "node_count"        = 3,
                        "node_config"       = {
                            "disk_size"     = "50GB",
                            "disk_type"     = "pd-standard",
                            "image_type"    = "COS",
                            "machine_type"  = "n1-standard-1"
                            "version"       = "1.15.11-gke.9"
                        },
                        "min_node_count"    = 3,
                        "max_node_count"    = 10
                }
