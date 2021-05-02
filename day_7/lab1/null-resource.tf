## Resource only to provision

resource "null_resource" "provision" {
  provisioner "local-exec" {
    command = "echo ${timestamp()} >> display.txt"
  }
}