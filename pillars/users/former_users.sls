former_users:
  - backbone
  - bci
  - blacklotus
  - digiweb
  - enestdata
  - globalaxs
  - ic-hosting
  - indit
  - msp
  - neotelecoms
  - networkdesign
  - networking4all
  - nuqe
  - nxs
  - rbnetwork
  - rediris
  - timico
  - xlshosting
  - yacast
  - nagios
  - bigwells

users:
{%- for former_user in salt['pillar.get']('former_users') -%}
  {{ former_user }}:
    - absent: True
    - purge: True
    - force: True
{% endfor %}
