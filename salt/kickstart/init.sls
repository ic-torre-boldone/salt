kickstart_config:
  file.managed:
    - name: /var/www/html/ks.cfg
    - source: salt://kickstart/ks.cfg.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: apache

kickstart_preseeded_data:
  file.managed:
    - source: salt://kickstart/settings.seed.jinja
    - name: /var/www/html/settings.seed
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: apache

saltstack_repo_key:
  file.managed:
    - source: salt://kickstart/saltstack.key
    - name: /var/www/html/saltstack.key
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: apache

