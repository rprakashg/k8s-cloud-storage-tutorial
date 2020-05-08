resource "google_container_cluster" "cluster" {
    provider                    = "google-beta"

    name                        = "${var.cluster.name}"
    location                    = "${var.cluster.zone}"  
    description                 = "${var.cluster.description}"
    min_master_version          = "${var.cluster.version}"

    initial_node_count          = 1
    remove_default_node_pool    = true

    master_auth {
        username = ""
        password    = ""

        client_certificate_config {
            issue_client_certificate = false
        }
    }

    addons_config {
       istio_config {
           disabled = false 
           auth = "AUTH_NONE"
       }
    }
}

resource "google_container_node_pool" "nodepool" {
    provider    = "google-beta"

    name        = "${var.cluster.name}-nodepool"
    location    = "${var.cluster.zone}"
    
    cluster     = google_container_cluster.cluster.name 
    node_count = "${var.cluster.node_count}"
    version = "${var.cluster.node_config.version}"

    node_config {
        machine_type = "${var.cluster.node_config.machine_type}"

        oauth_scopes = [
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
            "https://www.googleapis.com/auth/devstorage.read_only"
        ]
        
        metadata = {
            disable-legacy-endpoints = "true"
        }
    }

    autoscaling {
        min_node_count = "${var.cluster.min_node_count}"
        max_node_count = "${var.cluster.max_node_count}"
    }
}
