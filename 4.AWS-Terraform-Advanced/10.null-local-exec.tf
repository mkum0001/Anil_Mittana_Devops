resource "null_resource" "example" {
  # Triggers the execution of the local-exec provisioner
  triggers = {
    always_run = timestamp()
  }

  # Local-exec provisioner
  provisioner "local-exec" {
    command = "echo 'Hello, Terraform!'"
  }
}
