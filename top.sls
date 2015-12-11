base:
  '*':
    - salt
    - core_software
    - users
    - openssh.known_hosts

  'coloclue01.ring.nlnog.net':
    - munin.node
#   - hostsfile
#   - hostsfile.hostname

  'munin.infra.ring.nlnog.net':
    - munin.master
