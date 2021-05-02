# Configure the Docker provider
provider "docker" {
  host = "tcp://127.0.0.1:2375/"
}

# Pulling a docker image
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

# Create a container
resource "docker_container" "nodered_container" {
  image = docker_image.nodered_image.name
  name  = "NodeRed"

  ports {
    internal = "1880"
    external = "1880"
    protocol = "tcp"
  }
}