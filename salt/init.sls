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
      - file: /etc/salt/minion

/etc/salt/minion:
  file.managed:
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
      - file: /etc/salt/master

/etc/salt/master:
  file.managed:
    - source: salt://salt/master.conf
    - require:
      - pkg: salt_master_pkgs
{% endif %}
