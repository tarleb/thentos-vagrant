xvfb:
  pkg.installed

/etc/systemd/system/xvfb@.service:
  file.managed:
    - source: salt://xvfb/files/xvfb@.service
    - user: root
    - group: root
    - mode: 0644
