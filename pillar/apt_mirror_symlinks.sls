apt_mirror_symlinks:
  extra:
    target: /var/spool/apt-mirror/mirror/extras.ubuntu.com/ubuntu/
    name: /var/www/html/extras
  saltstack:
    target: /var/spool/apt-mirror/mirror/ppa.launchpad.net/saltstack/salt/ubuntu/
    name: /var/www/html/saltstack
  security:
    target: /var/spool/apt-mirror/mirror/security.ubuntu.com/ubuntu/
    name: /var/www/html/security
  ubuntu:
    target: /var/spool/apt-mirror/mirror/it.archive.ubuntu.com/ubuntu/
    name: /var/www/html/ubuntu
