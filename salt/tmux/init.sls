tmux_configuration_for_admin_user:
  file.managed:
    - name: /home/admin/.tmux.conf
    - source: salt://tmux/tmux.conf
    - user: admin
    - group: admin
    - mode: 644

tmux:
  pkg:
    - installed
