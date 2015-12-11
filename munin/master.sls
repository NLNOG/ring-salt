munin_master_pkgs:
  pkg.latest:
    - pkgs:
      - munin

munin_master_config:
  file.managed:
    - name: /etc/munin/munin.conf
    - source: salt://munin/files/munin-master.conf
    - template: jinja
  require:
    - pkg: munin_master_pkgs
