resource "local_file" "inventory" {
  content = <<-DOC
    
    [nginx]
    coberg.ru ansible_host="${yandex_compute_instance.node01.network_interface.0.nat_ip_address}" ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no'
    
    [db01]
    db01.coberg.ru ansible_host="${yandex_compute_instance.node02.network_interface.0.ip_address}" ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=10m -o ProxyCommand="ssh -W %h:%p -q ubuntu@62.84.115.226"'

    [db02]
    db02.coberg.ru ansible_host="${yandex_compute_instance.node03.network_interface.0.ip_address}" ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=10m -o ProxyCommand="ssh -W %h:%p -q ubuntu@62.84.115.226"'
   
    [wordpress]
    app.coberg.ru ansible_host="${yandex_compute_instance.node04.network_interface.0.ip_address}" ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=10m -o ProxyCommand="ssh -W %h:%p -q ubuntu@62.84.115.226"'

    [gitlab]
    gitlab.coberg.ru ansible_host="${yandex_compute_instance.node05.network_interface.0.ip_address}" ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=10m -o ProxyCommand="ssh -W %h:%p -q ubuntu@62.84.115.226"'

    [runner]
    runner.coberg.ru ansible_host="${yandex_compute_instance.node06.network_interface.0.ip_address}" ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=10m -o ProxyCommand="ssh -W %h:%p -q ubuntu@62.84.115.226"'

    [monitoring]
    monitoring.coberg.ru ansible_host="${yandex_compute_instance.node07.network_interface.0.ip_address}" ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=10m -o ProxyCommand="ssh -W %h:%p -q ubuntu@62.84.115.226"'


    DOC

  filename = "../ansible/inventory.yml"

  depends_on = [
    yandex_compute_instance.node01,
    yandex_compute_instance.node02,
    yandex_compute_instance.node03,
    yandex_compute_instance.node04,
    yandex_compute_instance.node05,
    yandex_compute_instance.node06,
    yandex_compute_instance.node07,
  ]
}