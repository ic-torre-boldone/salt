base:
  '* and not server-scuola-salt':
    - app_settings
    - software
    - users
  'server-scuola-salt':
    - dnsmasq
    - tmux
    - apache
    - kickstart
