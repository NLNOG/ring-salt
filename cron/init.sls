node_initiated_highstate:
  cron.present:
    - name: salt-call state.highstate
    - identifier: node_initiated_highstate
    - user: root
    - minute: random
    - hour: 1,13
