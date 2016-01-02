scamper_user:
  user.present:
    - fullname: Scamper collector
    - home: /home/scamper
    - uid: 2001
    - groups:
      - ring-users

scamper_pkgs:
  pkg.latest:
    - pkgs:
      - libscamperfile0
      - scamper

/home/scamper/traces:
  file.directory:
    - user: scamper

/etc/init/scamper.conf:
  file.managed:
    - source: salt://scamper/files/upstart-scamper.conf
    - user: root
    - group: root
    - mode: 0644

/home/scamper/run-traces.sh:
  file.managed:
    - source: salt://scamper/files/run-traces.sh
    - user: scamper
    - group: scamper
    - mode: 0755

scamper_service:
  service.running:
    - name: scamper
    - enable: True
    - watch:
      - pkg: scamper_pkgs

scamper_run:
  cron.present:
    - name: /home/scamper/run-traces.sh
    - user: scamper
    - minute: random

scamper_clean:
  cron.present:
    - name: find /home/scamper/collected/* -mtime +8 -exec rm {} \;
    - identifier: scamper_clean
    - user: root
    - minute: random
    - hour: 7,20
