include:
  - selenium.install
  - xvfb

selenium-hub:
  service.running:
    - require:
      - pkg: selenium-browser
      - pkg: openjdk
      - service: run-xvfb-on-display-99
      - file: /etc/systemd/system/selenium-hub.service
    - watch:
      - file: /etc/systemd/system/selenium-hub.service

selenium-node:
  service.running:
    - require:
      - pkg: selenium-browser
      - pkg: openjdk
      - service: run-xvfb-on-display-99
      - file: /etc/systemd/system/selenium-node.service
    - watch:
      - file: /etc/systemd/system/selenium-node.service

selenium-browser:
  pkg.installed:
    - name: iceweasel

openjdk:
  pkg.installed:
    - name: openjdk-7-jre-headless
