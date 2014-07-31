sshd_config:
  file.managed:
    - source: salt://sshd/sshd_config
    - name: /etc/ssh/sshd_config
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: openssh-server

authorized_keys_for_admin:
  file.managed:
    - source: salt://sshd/authorized_keys
    - name: /home/amministratore/.ssh/authorized_keys
    - makedirs: True
    - user: amministratore
    - group: amministratore
    - mode: 600
    - require:
      - user: amministratore

sshd:
  pkg.installed:
    - name: openssh-server
  service.running:
    - name: ssh
    - enable: True
    - watch:
      - file: sshd_config
    - require:
      - pkg: sshd

