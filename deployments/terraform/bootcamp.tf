# how many copies of the container we will start
variable "count" {
  default = 3
}

# define what container we are going to use
# and pull it from our Artifactory Docker registry (localhost:5002)
resource "docker_image" "atb" {
  name = "localhost:5002/atb:latest"
}

# Create the containers
resource "docker_container" "atb" {
  image = "${docker_image.atb.latest}"
  // using the count var automatically invokes this multiple times, no "loop" required
  count = "${var.count}"
  name = "atb-${count.index}"
}

