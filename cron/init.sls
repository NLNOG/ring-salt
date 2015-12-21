salt-call state.highstate:
  cron.present:
    - identifier: node_initiated_highstate
    - user: root
    - minute: random
    - hour: 1,13
