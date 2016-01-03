scamper_user:
  user.present:
    - name: scamper
    - fullname: Scamper collector
    - home: /home/scamper
    - uid: 2001
    - groups:
      - ring-users

? AAAAB3NzaC1yc2EAAAADAQABAAABAQDDyaUc5Z6W5ZsFw2qn53h9t6I95qCORNTgHcEbzn/Q+Ie6zaFF1Zk621I8TVKuId5tpe8iztkskGEzHD+MKhsumk2CjU4JGhECSaW2eULKy2eEfscrp5kMgFsIEy01KDmoRM+1ns8VFBBIc+bfEzcO+Jh/bzeMq4t7qtdtbBpJQvtNQwKdK0bTKh204tN6Mfi54J/H0h0fQVjW95+r9TYtfeecOMvUZmJF09qTWG9BOrM3Fe/Pggtn15PKCXgvba9vikfNfg5FLHTXTWZcfJubAafIJ0KJmfkYUEcSiaVvBsK9Ut0PBxc7oxLD05ZdFBU+VlVau9ssunlQ4/7oGgkD
:
  ssh_auth.present:
    - user: scamper
    - enc: ssh-rsa
    - comment: scamper_collector@storage01.infra.ring.nlnog.net

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
    - name: find /home/scamper/traces/* -mtime +8 -exec rm {} \;
    - identifier: scamper_clean
    - user: root
    - minute: random
    - hour: 7,20
