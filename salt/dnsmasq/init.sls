# dnsmasq is going to perform the following tasks:
# * dns server
# * dhcp server
# * tftp server

/var/ftpd:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - require:
      - pkg: dnsmasq

copy_ubuntu_netboot:
  module.run:
    - name: cp.get_dir
    - path: salt://dnsmasq/ubuntu_netboot/
    - dest: /var/ftpd/ubuntu14
    - require:
      - file.directory: /var/ftpd

/etc/dnsmasq.conf:
  file:
    - managed
    - source: salt://dnsmasq/dnsmasq.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: dnsmasq

grub_netboot_i386_cfg:
  file.managed:
    - source: salt://dnsmasq/grub_netboot_i386.cfg
    - name: /var/ftpd/ubuntu14/ubuntu_netboot/ubuntu-installer/i386/boot-screens/txt.cfg
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - module.run: copy_ubuntu_netboot

dnsmasq:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/dnsmasq.conf
    - require:
      - pkg: dnsmasq
      - module.run: copy_ubuntu_netboot
      - file: grub_netboot_i386_cfg

