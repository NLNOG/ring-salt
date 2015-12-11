node:
  pkg.installed:
    - pkgs:
      - munin-node
      - munin-common
      - munin-plugins-core
      - munin-plugins-extra

  service.running:
    - name: munin-node
    - enable: True
    - watch:
      - file: /etc/munin/munin-node.conf
    - require:
      - pkg: munin-node

/etc/munin/munin-node.conf:
  file.managed:
    - source: salt://munin/munin-node.conf
