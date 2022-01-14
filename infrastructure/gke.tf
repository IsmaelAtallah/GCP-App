resource "google_container_cluster" "primary" {
  name     = "dev-ops-cluster"
  location = "australia-southeast1"
  network =  google_compute_network.vpc_network.id 
  subnetwork = google_compute_subnetwork.restricted_subnet.id 
  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
     enable_private_nodes=true
      enable_private_endpoint = true
     master_ipv4_cidr_block = "172.16.2.0/28"

  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block =  "10.3.0.0/16"
    services_ipv4_cidr_block = "10.2.0.0/16"

  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block ="10.0.0.0/24"
      display_name="management-subnet"
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "australia-southeast1"
  cluster    = google_container_cluster.primary.name
  node_count = 1
  
  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    service_account = google_service_account.sa.email
    oauth_scopes =["https://www.googleapis.com/auth/cloud-platform"]
  }
  
}

