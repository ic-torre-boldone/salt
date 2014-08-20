# Per creare le password: apt-get install whois; mkpasswd -m sha-512

# La password di studente e' 'studente'.

{% if 'lab' in salt['grains.get']('host', '') %}
studente:
  user.present:
    - shell: /bin/bash
    - home: /home/studente
    - createhome: True
    - password: $6$LJH7qw07UbVd$tVyTBtjwuIR9ZLASs6ntR.wlymjQTv1DuXeqy1G5vgp0Ptm04.jF7lCEQP51qHYuqOxDjxz4i.Oqi3dADhoGR1
    - enforce_password: True
{% endif %}

{% if 'pc-aula' in salt['grains.get']('host', '') %}
insegnante:
  user.present:
    - shell: /bin/bash
    - home: /home/insegnante
    - createhome: True
    - password: $6$lQPCRFm99H$xxww49VOrjb6SHXID15CF2MUB5gIRbwcFlPHqjqUm0EkD/Hw.pLWTbQNIZY.HCilB3KvfeuoU3j6FWrwBiT1r.
    - enforce_password: True
{% endif %}

# La password di amministratore e' 'amministratore'.
amministratore:
  user.present:
    - shell: /bin/bash
    - home: /home/amministratore
    - createhome: True
    - password: $6$RK8fyJaWuvVz4IR$vpimlxRQNN5drtXRPiS05typvv9cTWUdFThaMdYo7UL1Xuyp2qA8zLwVbLjJEfVuLmZIu.Geg4tz9HJnIliY71
    - enforce_password: True
    - groups:
      - admin
    - require:
      - group: admin

