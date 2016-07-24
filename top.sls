base:
  '*':
    - salt
    - users
    - openssh.known_hosts
    - munin.node
    - cron

  '*.ring.nlnog.net and not *.infra.ring.nlnog.net':
    - scamper

  'compute01.infra.ring.nlnog.net':
    - munin.master

  'master01.infra.ring.nlnog.net':
    - cron.master
