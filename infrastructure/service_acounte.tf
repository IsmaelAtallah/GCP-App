variable "clusterrolesList" {
  type =list(string)
  default = ["roles/container.admin","roles/container.clusterAdmin","roles/container.clusterViewer","roles/container.developer","roles/container.hostServiceAgentUser","roles/container.viewer","roles/storage.admin","roles/admin"]
}
resource "google_service_account" "sa" {
  account_id   = "cluster-service"
  display_name = "cluster-service"

}
resource "google_project_iam_binding" "cluster" {
  count = length(var.clusterrolesList)
  project = "ismael-lab"
  role   =var.clusterrolesList[count.index] 
  
  members = [
    "serviceAccount:${google_service_account.sa.email}",
  ]
}