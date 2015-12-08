{% for package in pillar.get('core_packages', []) %}
{{package}}:
    pkg:
        - installed
{% endfor %}
