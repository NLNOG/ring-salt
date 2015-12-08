{% for package in pillar.get('base_software:packages', {}).items() %}
{{package}}:
    pkg:
        - installed
{% endfor %}
