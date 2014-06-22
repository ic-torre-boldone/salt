ntpdate_cfg:
  file.managed:
    - source: salt://ntpdate/ntpdate.conf.jinja
    - name: /etc/default/ntpdate.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja

ntpdate_cron_daily:
  file.managed:
    - source: salt://ntpdate/cron_daily.jinja
    - name: /etc/cron.daily/ntpdate
    - user: root
    - group: root
    - mode: 755
    - template: jinja

ntpdate_hourly_cron:
  cron.present:
    - name: ntpdate {{salt['grains.get']('master', 'ERROR')}}
    - minute: random
    - hour: 12

ntpdate:
  pkg:
    - installed
    - require:
      - file: ntpdate_cron_daily
      - file: ntpdate_cfg

