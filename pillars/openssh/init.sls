openssh:
  known_hosts:
    mine_keys_function: public_ssh_host_keys
    mine_hostname_function: public_ssh_hostname

mine_functions:
  public_ssh_host_keys:
    mine_function: cmd.run
    cmd: cat /etc/ssh/ssh_host_*_key.pub
    python_shell: True
  public_ssh_hostname:
    mine_function: grains.get
    key: id
