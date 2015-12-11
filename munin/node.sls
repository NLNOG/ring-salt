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
    - source: salt://munin/munin-node.conf

grains.present:
  - name: munin_node
  - value: installed
  - require:
    - service: munin_service
    - file: munin_node_config
    - pkg: munin_node_pkgs
