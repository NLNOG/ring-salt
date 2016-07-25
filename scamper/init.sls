scamper_run:
  cron.absent:
    - name: /home/scamper/run-traces.sh
    - user: scamper
    - minute: random

scamper_clean:
  cron.absent:
    - name: find /home/scamper/traces/* -mtime +8 -exec rm {} \;
    - identifier: scamper_clean
    - user: root
    - minute: random
    - hour: 7,20
