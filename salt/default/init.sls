include:
  - apt

default:
  pkg:
    - latest
    - names:
      - sudo
    - require:
      - cmd: apt-upgrade

