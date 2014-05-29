base:
  '* and not server-scuola-salt':
    - lightdm
    - software
    - users
  'server-scuola-salt':
    - dnsmasq
    - tmux
    - apache
    - kickstart
