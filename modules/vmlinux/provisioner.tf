resource "null_resource" "linux_hostname" {
  for_each = var.vm_names

  triggers = {
    vm_id = azurerm_linux_virtual_machine.linux[each.key].id
  }

  connection {
    type        = "ssh"
    host        = azurerm_public_ip.linux[each.key].ip_address
    user        = var.admin_username
    private_key = file(pathexpand("~/.ssh/id_rsa"))
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Linux hostname:'",
      "hostname"
    ]
  }
}
