ring_sqa_pkgs:
  gem.install:
    - pkgs:
      - ring-sqa
      - SyslogLogger

/etc/ring-sqa:
  file.directory:
    - user: root
    - mode: 755

/etc/ring-sqa/main.conf:
  file.managed:
    - source: salt://ring_sqa/files/main.conf
    - require:
      - file: /etc/ring-sqa

/etc/ring-sqa/hosts.conf:
  file.managed:
    - source: salt://ring_sqa/files/hosts.conf
    - require:
      - file: /etc/ring-sqa

/etc/init/ring-sqa4.conf:
  file.managed:
    - source: salt://ring_sqa/files/upstart-ring-sqa4.conf
    - require:
      - file: /etc/ring-sqa

/etc/init/ring-sqa6.conf:
  file.managed:
    - source: salt://ring_sqa/files/upstart-ring-sqa6.conf
    - require:
      - file: /etc/ring-sqa

ring_sqa4_service:
  service.running:
    - name: ring-sqa4
    - watch:
      - file: /etc/ring-sqa/main.conf
      - file: /etc/ring-sqa/hosts.conf
    - enable: True
    - provider: upstart
    - require:
      - file: /etc/ring-sqa/main.conf
      - file: /etc/init/ring-sqa4.conf
      - gem: ring_sqa_pkgs

ring_sqa6_service:
  service.running:
    - name: ring-sqa6
    - watch:
      - file: /etc/ring-sqa/main.conf
      - file: /etc/ring-sqa/hosts.conf
    - enable: True
    - provider: upstart
    - require:
      - file: /etc/ring-sqa/main.conf
      - file: /etc/init/ring-sqa6.conf
      - gem: ring_sqa_pkgs
