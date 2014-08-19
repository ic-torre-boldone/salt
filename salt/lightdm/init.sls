lightdm_custom_conf_file:
  file.managed:
    - source: salt://lightdm/lightdm.conf.jinja
    - name: /etc/lightdm/lightdm.conf.d/ic_torre_boldone.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: lightdm_custom_conf_dir

lightdm_custom_conf_dir:
  file.directory:
    - name: /etc/lightdm/lightdm.conf.d/
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
      - file: lightdm_custom_conf_file
    - require:
      - pkg: lightdm

