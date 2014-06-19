ntpd_conf:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntpd/ntp.conf
    - user: root
    - group: root
    - mode: 644

ntpdate:
  pkg:
    - removed

ntpd:
  pkg.installed:
    - name: ntp
  service:
    - name: ntp
    - running
    - enable: True
    - watch:
      - file: ntpd_conf
    - require:
      - pkg: ntpd
      - file: ntpd_conf

