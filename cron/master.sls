salt '*' -b 40 state.highstate:
  cron.present:
    - identifier: master_initiated_highstate
    - user: root
    - minute: random
    - hour: 7,20
