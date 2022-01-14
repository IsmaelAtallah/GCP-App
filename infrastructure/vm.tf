resource "google_compute_instance" "vm" {
  name         = "private-vm"
  machine_type = "e2-micro"
  zone         = "australia-southeast1-b"
  
  boot_disk{
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface{
      subnetwork= google_compute_subnetwork.management_subnet.name
  }
  service_account {
    email  = google_service_account.sa.email
    scopes = ["cloud-platform"]
  }
  
  metadata_startup_script = "sudo apt update && sudo apt install kubectl"

}