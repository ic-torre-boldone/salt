# dnsmasq is going to perform the following tasks:
# * dns server
# * dhcp server
# * tftp server

ftpd_directory:
  file.directory:
    - name: /var/ftpd
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - require:
      - pkg: dnsmasq

copy_ubuntu_netboot:
  module.run:
    - name: cp.get_dir
    - path: salt://dnsmasq/ubuntu14/
    - dest: /var/ftpd/
    - require:
      - file.directory: ftpd_directory

dnsmasq_conf:
  file.managed:
    - name: /etc/dnsmasq.conf
    - source: salt://dnsmasq/dnsmasq.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: dnsmasq

grub_netboot_i386_cfg:
  file.managed:
    - source: salt://dnsmasq/grub_netboot_i386.cfg
    - name: /var/ftpd/ubuntu14/ubuntu-installer/i386/boot-screens/txt.cfg
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
      - file: dnsmasq_conf
    - require:
      - pkg: dnsmasq
      - module.run: copy_ubuntu_netboot
      - file: grub_netboot_i386_cfg

