resource "docker_image" "jenkins_image" {
  name = "jenkins/jenkins"
}

resource "docker_container" "jenkins_container" {
  image = docker_image.jenkins_image.name
  name  = "JenkinsCI"
  user  = "root"

  ports {
    internal = "8080"
    external = "8080"
    protocol = "tcp"
  }
}