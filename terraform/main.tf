resource "docker_image" "redis" {
  name = "redis:latest"
}

resource "docker_container" "redis" {
  image = docker_image.redis.image_id
  name  = "redis"
  ports {
    internal = 6379
    external = 6379
  }
  network_mode = docker_network.private_network.name
}

resource "docker_image" "postgres" {
  name = "postgres:latest"
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.image_id
  name  = "postgres"
  env = ["POSTGRES_PASSWORD=senhafacil",]
  ports {
    internal = 5432
    external = 5432
  }
  network_mode = docker_network.private_network.name
}


resource "docker_image" "app" {
  name = "app"
  build {
    context = "../."
    tag     = ["app:latest"]
  }
}

resource "docker_container" "app" {
  image = docker_image.app.image_id
  name  = "app"
  ports {
    internal = 5000
    external = 5000
  }
  ports {
    internal = 9999
    external = 9999
  }
  network_mode = docker_network.private_network.name
}

resource "docker_network" "private_network" {
  name = "xablau"
}

