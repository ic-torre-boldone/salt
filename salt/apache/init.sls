apache:
  pkg.installed:
    - name: apache2
  service:
    - name: apache2
    - running
    - enable: True
    - require:
      - pkg: apache
