base:
  '*':
    - salt
    - users
    - openssh.known_hosts
    - munin.node
    - cron

  'compute01.infra.ring.nlnog.net':
    - munin.master

  'master01.infra.ring.nlnog.net':
    - cron.master
