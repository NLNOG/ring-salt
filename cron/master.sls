salt '*' -b 40 state.highstate:
  cron.present:
    - user: root
    - minute: random
    - hour: 7,20
