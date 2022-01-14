provider "google" {
  credentials = "${file("ismael-lab-d5b80d24b855.json")}"
  project     = "ismael-lab"
  region      = "australia-southeast1"
}
