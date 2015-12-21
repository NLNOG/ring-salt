base:
  '*':
    - salt
    - core_software
    - users
    - openssh.known_hosts
    - munin.node
    - cron

  '*.ring.nlnog.net and not *.infra.ring.nlnog.net':
    - ring_sqa

#  'coloclue01.ring.nlnog.net':
#   - hostsfile
#   - hostsfile.hostname

  'munin.infra.ring.nlnog.net':
    - munin.master

  'master01.infra.ring.nlnog.net':
    - cron.master
