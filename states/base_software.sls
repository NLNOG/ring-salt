{% for package in pillar.get('base_software', {}).items() %}
{{package}}:
    pkg:
        - installed
{% endfor %}
