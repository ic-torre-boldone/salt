/etc/lightdm/lightdm.conf.d/ic_torre_boldone.conf:
  file:
    - managed
    - source: salt://app_settings/lightdm.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file.directory: /etc/lightdm/lightdm.conf.d/

/etc/lightdm/lightdm.conf.d/:
  file.directory:
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: lightdm

lightdm:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/lightdm/lightdm.conf.d/ic_torre_boldone.conf
    - require:
      - pkg: lightdm

