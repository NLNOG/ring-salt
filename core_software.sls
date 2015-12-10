{% for package in pillar.get('core_packages', []) %}
{{package}}:
  pkg:
    - installed
{% endfor %}

{% for package in pillar.get('remove_packages', []) %}
{{package}}:
  pkg:
    - purged
{% endfor %}
