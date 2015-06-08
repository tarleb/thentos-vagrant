rinetd:
  pkg.installed

/etc/rinetd.conf:
  file.managed:
    - source: salt://rinetd/files/rinetd.conf
    - user: root
    - group: root
    - mode: 0644

run-rinetd-service:
  service.running:
    - name: rinetd
    - requires:
      - pkg: rinetd
    - watch:
      - file: /etc/rinetd.conf
