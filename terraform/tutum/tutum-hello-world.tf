# how many copies of the container we will start
variable "count" {
  default = 3
}

# define what container we are going to use
resource "docker_image" "hello-world" {
  name = "tutum/hello-world:latest"
}

# Create the containers
resource "docker_container" "hello-world" {
  image = "${docker_image.hello-world.latest}"
  // using the count var automatically invokes this multiple times, no "loop" required
  count = "${var.count}"
  name = "hello-world-${count.index}"
}

# and now front it all with a haproxy container
resource "docker_image" "haproxy" {
  name = "tutum/haproxy:latest"
}

resource "docker_container" "haproxy" {
  depends_on = ["docker_container.hello-world"]
  image = "${docker_image.haproxy.latest}"
  ports = {external = 8088
           internal = 80}
  links = ["${docker_container.hello-world.*.name}"]
  name = "haproxy"
}
