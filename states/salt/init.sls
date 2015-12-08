salt-minion:
    service:
        - running
        - watch:
            - file: /etc/salt/minion

/etc/salt/minion:
    file.source: salt://salt/minion.conf

{% if salt['grains.get']('fqdn') == 'master01.infra.ring.nlnog.net' %}
salt-master:
    service:
        - running
        - watch:
            - file: /etc/salt/master

/etc/salt/master:
    file.source: salt://salt/master.conf
{% endif %}
