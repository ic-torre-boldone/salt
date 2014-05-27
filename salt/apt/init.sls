apt-update:
  cmd:
    - run
    - name: apt-get update
    - require:
      - file: /etc/apt/sources.list

apt-upgrade:
  cmd:
    - run
    - name: apt-get --assume-yes upgrade
    - require:
      - cmd: apt-update

/etc/apt/sources.list:
  file:
    - managed
    - source: salt://apt/sources.list
    - user: root
    - group: root
    - mode: 644
