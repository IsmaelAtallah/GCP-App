resource "google_compute_firewall" "iap-ssh" {
  project   = "ismael-lab"
  network   =  google_compute_network.vpc_network.name
  name      = "allow-iap-ssh"
  priority  = 1000
  direction = "INGRESS"
  allow {
    protocol  = "tcp"
    ports     = ["22","80"]
  }
  source_ranges  = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "allow-http" {
  project   = "ismael-lab"
  network   =  google_compute_network.vpc_network.name
  name      = "allow-http"
  priority  = 1000
  direction = "INGRESS"
  allow {
    protocol  = "tcp"
    ports     = ["80"]
  }
  source_ranges  = ["10.0.0.0/24"]
}


