salt_pkgs:
  pkg.latest:
    - pkgs:
      - salt-minion
      - salt-common

salt-minion:
  service:
    - running
    - watch:
      - file: /etc/salt/minion
    - require:
      - pkg: salt_pkgs
      - file: salt_minion_configfile

salt_minion_configfile:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://salt/minion.conf

{% if salt['grains.get']('fqdn') == 'master01.infra.ring.nlnog.net' %}

salt_master_pkgs:
  pkg.latest:
    - name: salt-master

salt-master:
  service:
    - running
    - watch:
      - file: /etc/salt/master
    - require:
      - pkg: salt_master_pkgs
      - file: salt_master_configfile

salt_master_configfile:
  file.managed:
    - name: /etc/salt/master
    - source: salt://salt/master.conf
    - require:
      - pkg: salt_master_pkgs

{% endif %}
