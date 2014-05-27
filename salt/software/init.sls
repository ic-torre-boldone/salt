edubuntu:
  pkg.installed:
    - names:
      {% for package in pillar.get('software', []) %}
      - {{package}}
      {% endfor %}

