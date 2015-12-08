users:
{% for former_user in pillar.get('former_users') %}
    {{former_user}}:
        absent: True
        purge: True
        force: True
{% endfor %}
