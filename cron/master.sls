master_initiated_highstate:
  cron.present:
    - name: chronic salt '*' -b 40 state.highstate
    - identifier: master_initiated_highstate
    - user: root
    - minute: random
    - hour: 7,20
