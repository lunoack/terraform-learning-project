provider "docker" {}

resource "docker_network" "demo" {
  name = "tf-demo-net"
}

resource "docker_container" "nginx" {
  name  = "tf-nginx"
  image = docker_image.nginx.image_id
  networks_advanced {
    name = docker_network.demo.name
  }

  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}
