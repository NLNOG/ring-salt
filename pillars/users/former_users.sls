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
    - xlshosting:
    - yacast

users:
{% for former_user in pillar.get('former_users', []) %}
    {{former_user}}:
        absent: True
        purge: True
        force: True
{% endfor %}
