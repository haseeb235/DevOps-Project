provider "google" {
  credentials = file("<path-to-your-gcp-json-key>")
  project     = "<myproject-3F56@12>"
  region      = "us-central1"
}

resource "google_container_cluster" "my_cluster" {
  name     = "my-cluster"
  location = "us-central1"

  node_pool {
    name       = "default-pool"
    node_count = 1
  }
}

output "kubeconfig" {
  value = google_container_cluster.my_cluster.kubeconfig[0].raw_config
}