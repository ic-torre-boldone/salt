mac2hostname_binary:
  file.managed:
    - source: salt://mac2hostname/mac2hostname
    - name: /usr/bin/mac2hostname
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: mac2hostname_configuration

mac2hostname_configuration:
  file.managed:
     - source: salt://mac2hostname/config.yaml
     - name: /etc/mac2hostname/config.yaml
     - user: root
     - group: root
     - mode: 644
     - makedirs: True

mac2hostname_db_dir:
  file.directory:
      - name: /var/lib/mac2hostname
      - user: root
      - group: root
      - mode: 644


mac2hostname:
  file.managed:
    - source: salt://mac2hostname/upstart.conf
    - name: /etc/init/mac2hostname.conf
    - user: root
    - group: root
    - mode: 644
  service:
    - running
    - enable: True
    - watch:
      - file: mac2hostname_configuration
    - require:
        - file: mac2hostname_binary
        - file: mac2hostname_configuration
        - file.directory: mac2hostname_db_dir
