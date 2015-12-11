base:
  '*':
    - salt
    - core_software
    - users
    - openssh.known_hosts
    - munin.node

#  'coloclue01.ring.nlnog.net':
#   - hostsfile
#   - hostsfile.hostname

  'munin.infra.ring.nlnog.net':
    - munin.master
