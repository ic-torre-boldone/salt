# Per creare le password: apt-get install whois; mkpasswd -m sha-512

# La password di studente e' 'studente'.

{% if not 'server-scuola' in salt['grains.get']('master', '') %}
studente:
  user.present:
    - shell: /bin/bash
    - home: /home/studente
    - createhome: True
    - password: $6$LJH7qw07UbVd$tVyTBtjwuIR9ZLASs6ntR.wlymjQTv1DuXeqy1G5vgp0Ptm04.jF7lCEQP51qHYuqOxDjxz4i.Oqi3dADhoGR1
    - enforce_password: True
{% endif %}

amministratore:
  user.present:
    - shell: /bin/bash
    - home: /home/amministratore
    - createhome: True
    - password: $6$RK8fyJaWuvVz4IR$vpimlxRQNN5drtXRPiS05typvv9cTWUdFThaMdYo7UL1Xuyp2qA8zLwVbLjJEfVuLmZIu.Geg4tz9HJnIliY71
    - enforce_password: True

