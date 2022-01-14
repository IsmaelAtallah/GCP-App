resource "google_compute_network" "vpc_network" {
  project                 = "ismael-lab"
  name                    = "dev-ops-vpc"
  auto_create_subnetworks = false
}

