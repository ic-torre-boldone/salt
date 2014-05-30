kickstart_config:
  file.managed:
    - name: /var/www/html/ks.cfg
    - source: salt://kickstart/ks.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: apache

kickstart_preseeded_data:
  file.managed:
    - source: salt://kickstart/settings.seed
    - name: /var/www/html/settings.seed
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: apache

