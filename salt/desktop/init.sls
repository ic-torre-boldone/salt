firefox_desktop_icon:
  file.managed:
    - name: /home/insegnante/Scrivania/firefox.desktop
    - source: salt://desktop/firefox.desktop
    - user: insegnante 
    - group: insegnante 
    - mode: 644
    - makedirs: True
    - require:
      - user: insegnante 

firefox:
  pkg:
    - installed
