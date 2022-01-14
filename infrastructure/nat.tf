resource "google_compute_router" "router" {
  name    = "nat-router"
  region  = google_compute_subnetwork.management_subnet.region
  network = google_compute_network.vpc_network.id
}
resource "google_compute_router_nat" "nat" {
  name                               = "dev-ops-nat"
  router                             = google_compute_router.router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.management_subnet.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

