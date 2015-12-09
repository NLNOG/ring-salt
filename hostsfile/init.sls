# populate /etc/hosts with names and IP entries from your salt cluster
# the minion id has to be the fqdn for this to work

{%- set fqdn = grains['id'] %}
# example configuration for /etc/salt/minion:
#
# mine_functions:
#  network.ip_addrs:
#    - eth1
#  mine_interval: 2

{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('*', minealias) %}

{%- set minealias6 = salt['pillar.get']('hostsfile:alias6', 'network.ip_addrs6') %}
{%- set addrs6 = salt['mine.get']('*', minealias6) %}

{%- for name, addrlist in addrs.items() %}

# hack for amazon, who have RFC1918 IPv4 space on the nodes
{%- if name.startswith('amazon') %}
{%- set addrlist = salt['mine.get'](name, 'fqdn_ip4').items()|first %}
{%- endif %}

{{ name }}-host-entry:
  host.present:
{% if addrlist is string %}
    - ip: {{ addrlist }}
{% else %}
    - ip: {{ addrlist|first }}
{% endif %}
    - names:
      - {{ name }}
{% endfor %}

{%- for name, addrlist in addrs6.items() %}
{{ name }}-host-v6-entry:
  host.present:
{% if addrlist is string %}
    - ip: {{ addrlist }}
{% else %}
    - ip: {{ addrlist|first }}
{% endif %}
    - names:
      - {{ name }}
{% endfor %}
