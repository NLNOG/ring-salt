salt-call state.highstate:
  cron.present:
    - user: root
    - minute: random
    - hour: 13
