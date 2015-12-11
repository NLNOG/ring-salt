munin_node_pkgs:
  pkg.latest:
    - pkgs:
      - munin-node
      - munin-common
      - munin-plugins-core
      - munin-plugins-extra

munin_service:
  service.running:
    - name: munin-node
    - enable: True
    - watch:
      - file: /etc/munin/munin-node.conf
    - require:
      - pkg: munin_node_pkgs
      - file: munin_node_config

munin_node_config:
  file.managed:
    - name: /etc/munin/munin-node.conf
    - source: salt://munin/files/munin-node.conf

munin_node:
  grains.present:
    - value: installed
  require:
    - pkg: munin_node_pkgs
    - service: munin_service
    - file: munin_node_config
