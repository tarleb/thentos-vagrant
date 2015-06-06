include:
  - xvfb.install

run-xvfb-on-display-99:
  service.running:
    - name: xvfb@:99
    - requires:
      - pkg: xvfb
      - file: /etc/systemd/system/xvfb@.service

