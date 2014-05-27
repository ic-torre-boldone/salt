# Per creare le password: apt-get install whois; mkpasswd -m sha-512

# La password di studente e' 'studente'.

studente:
  user.present:
    - shell: /bin/bash
    - home: /home/studente
    - password: $6$LJH7qw07UbVd$tVyTBtjwuIR9ZLASs6ntR.wlymjQTv1DuXeqy1G5vgp0Ptm04.jF7lCEQP51qHYuqOxDjxz4i.Oqi3dADhoGR1
    - enforce_password: True

