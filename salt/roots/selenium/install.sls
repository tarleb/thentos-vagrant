/etc/systemd/system/selenium-hub.service:
  file.managed:
    - source: salt://selenium/files/selenium-hub.service
    - user: root
    - group: root
    - mode: 0644
    - required_in:
      - service: selenium-hub

/etc/systemd/system/selenium-node.service:
  file.managed:
    - source: salt://selenium/files/selenium-node.service
    - user: root
    - group: root
    - mode: 0644
    - required_in:
      - service: selenium-node

/usr/local/lib/jvm/selenium-server-standalone.jar:
  file.managed:
    - source: https://selenium-release.storage.googleapis.com/2.46/selenium-server-standalone-2.46.0.jar
    - source_hash: sha256=deb997cfbbc29680b20e7af6960b5c49ecd5aa3e17fba0d3288cfb9c62a9b9e6
    - makedirs: True
    - replace: False
    - required_in:
      - service: selenium-hub
      - service: selenium-node
