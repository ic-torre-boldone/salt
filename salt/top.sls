base:
  '*':
    - users
    - groups
    - sshd
  'pc-aula*':
    - desktop
    - lightdm
    - software
  'lab*':
    - lightdm
    - software
    - ntpdate
  'server-scuola*':
    - apache
    - apt-mirror
    - dnsmasq
    - final_touch
    - kickstart
    - mac2hostname
    - ntpd
    - tmux
