munin_master_pkgs:
  pkg.latest: munin

munin_node_config:
  file.managed:
    - name: /etc/munin/munin.conf
    - source: salt://munin/munin-master.conf
    - template: jinja
  require:
    - munin_master_pkgs
