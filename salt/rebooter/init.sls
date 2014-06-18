rebooter_script:
  file.managed:
    - source: salt://rebooter/rebooter.py
    - name: /usr/bin/rebooter
    - user: root
    - group: root
    - mode: 755
