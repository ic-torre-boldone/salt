/home/admin/.tmux.conf:
  file:
    - managed
    - source: salt://tmux/tmux.conf
    - user: admin
    - group: admin
    - mode: 644

tmux:
  pkg:
    - installed
