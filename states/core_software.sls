{% for package in pillar.get('core_packages', {}).items() %}
{{package}}:
    pkg:
        - installed
{% endfor %}
