final_touch_script:
  file.managed:
    - source: salt://final_touch/final_touch
    - name: /usr/bin/final_touch
    - user: root
    - group: root
    - mode: 755
