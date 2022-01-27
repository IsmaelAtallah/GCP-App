provider "google" {
  credentials = "${file("ismael-lab-d6dd082c0a4e.json")}"
  project     = "ismael-lab"
  region      = "australia-southeast1"
}
