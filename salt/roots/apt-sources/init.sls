/etc/apt/preferences:
  file.managed:
    - source: salt://apt-sources/files/preferences
    - user: root
    - group: root
    - mode: 644

apt-sources:
  pkgrepo.managed:
    - name: deb http://ftp.de.debian.org/debian/ sid main
    - file: /etc/apt/sources.list.d/sid.list
