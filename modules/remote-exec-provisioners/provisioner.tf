provider "aws" {
  region = "eu-west-1"
}

resource "null_resource" "remote-exec" {
  count = "${length(module.ec2-app-v1.ec2-public-ip)}"


  provisioner "file" {
    source = "./modules/remote-exec-provisioners/httpd.sh"
    destination  = "/tmp/httpd.sh"
    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("./bari-terraform-v2.pub")}"
      host     = "82.3.67.147"
      timeout = "2m"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/httpd.sh",
      "sudo /tmp/httpd.sh"
    ]
    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("./modules/remote-exec-provisioners/bari-terraform-v2.pub")}"
      host     = "82.3.67.147"
      timeout = "2m"
    }
  }
}

#OUTPUTS
output "remote-exec" {
  value = "${null_resource.remote-exec.*.id}"
}