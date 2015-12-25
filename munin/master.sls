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

munin_master_apache_config:
  file.managed:
    - name: /etc/munin/apache.conf
    - source: salt://munin/files/munin-apache.conf
  require:
    - pkg: munin_master_pkgs

munin_master_apache_symlink:
  file.symlink:
    - nane: /etc/apache2/conf.d/munin.conf
    - target: /etc/munin/apache.conf
  require:
    - pkg: munin_master_pkgs

/var/lib/munin/cgi-tmp:
  file.directory:
    - user: www-data
    - group: www-data
    - recurse:
      - user
      - group
