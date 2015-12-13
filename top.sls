base:
  '*':
    - salt
    - core_software
    - users
    - openssh.known_hosts
    - munin.node

  '*.ring.nlnog.net and not *.infra.ring.nlnog.net':
    - ring_sqa

#  'coloclue01.ring.nlnog.net':
#   - hostsfile
#   - hostsfile.hostname

  'munin.infra.ring.nlnog.net':
    - munin.master
