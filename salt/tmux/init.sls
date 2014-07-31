tmux_configuration_for_amministratore_user:
  file.managed:
    - name: /home/amministratore/.tmux.conf
    - source: salt://tmux/tmux.conf
    - user: amministratore
    - group: amministratore
    - mode: 644
    - require:
      - user: amministratore

tmux:
  pkg:
    - installed
