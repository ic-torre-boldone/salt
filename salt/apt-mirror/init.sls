apt_mirror_conf:
  file.managed:
    - source: salt://apt-mirror/mirror.list
    - name: /etc/apt/mirror.list
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: apt-mirror

apt-mirror:
  pkg:
    - installed

{% for symlink_id in pillar.get('apt_mirror_symlinks', {}).keys() %}
{{symlink_id}}_directory:
  file.directory:
    - name: {{pillar.get('apt_mirror_symlinks')[symlink_id]['target']}}
    - user: apt-mirror
    - group: apt-mirror
    - mode: 755
    - makedirs: True
    - require:
      - pkg: apt-mirror
{% endfor %}


{% for symlink_id in pillar.get('apt_mirror_symlinks', {}).keys() %}
{{symlink_id}}_apache_link:
  file.symlink:
    - name: {{pillar.get('apt_mirror_symlinks')[symlink_id]['name']}}
    - target: {{pillar.get('apt_mirror_symlinks')[symlink_id]['target']}}
    - force: True
{% endfor %}

