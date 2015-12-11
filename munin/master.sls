munin_master_pkgs:
  pkg.latest:
    - pkgs:
      - munin

munin_node_config:
  file.managed:
    - name: /etc/munin/munin.conf
    - source: salt://munin/munin-master.conf
    - template: jinja
  require:
    - pkg: munin_master_pkgs
