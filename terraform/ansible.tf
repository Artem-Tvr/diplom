resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 30"
  }

  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "clean_known_hosts" {
  provisioner "local-exec" {
    command = <<EOT
      ssh-keygen -R 62.84.115.226
      ssh-keygen -R 192.168.100.11
      ssh-keygen -R 192.168.101.12
      ssh-keygen -R 192.168.101.13
      ssh-keygen -R 192.168.101.14
      ssh-keygen -R 192.168.101.15
      ssh-keygen -R 192.168.101.16
      ssh-keygen -R 192.168.101.17
    EOT
  }
  depends_on = [
    null_resource.wait
  ]
}

# resource "null_resource" "nginx" {
#   provisioner "local-exec" {
#     command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i /Users/artem/DevOps/Diplom/code/ansible/inventory.yml /Users/artem/DevOps/Diplom/code/ansible/roles/nginx.yml"
#   }

#   depends_on = [
#     null_resource.clean_known_hosts
#   ]
# }

# resource "null_resource" "db" {
#   provisioner "local-exec" {
#     command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i /Users/artem/DevOps/Diplom/code/ansible/inventory.yml /Users/artem/DevOps/Diplom/code/ansible/roles/db/db-setup.yml"
#   }

#  depends_on = [
#     null_resource.nginx
#   ]
# }

# resource "null_resource" "wordpress" {
#   provisioner "local-exec" {
#     command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i /Users/artem/DevOps/Diplom/code/ansible/inventory.yml /Users/artem/DevOps/Diplom/code/ansible/roles/openlitespeed_wordpress/playbook.yml"
#   }

#  depends_on = [
#     null_resource.db
#   ]
# }

# resource "null_resource" "runner" {
#   provisioner "local-exec" {
#     command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i /Users/artem/DevOps/Diplom/code/ansible/inventory.yml /Users/artem/DevOps/Diplom/code/ansible/roles/gitlab.yml"
#   }

#  depends_on = [
#     null_resource.wordpress
#   ]
# }

# resource "null_resource" "monitoring" {
#   provisioner "local-exec" {
#     command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i /Users/artem/DevOps/Diplom/code/ansible/inventory.yml /Users/artem/DevOps/Diplom/code/ansible/roles/monitoring/monitoring.yml"
#   }

#  depends_on = [
#     null_resource.runner
#   ]
# }

