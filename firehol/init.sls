{%- from "firehol/map.jinja" import firehol with context -%}

firehol-package:
  pkg.installed:
    - name: {{ firehol.package }}

firehol-service:
  service.running:
    - name: {{ firehol.service }}
    - enable: True
    - require:
      - pkg: firehol-package

firehol-restart:
  module.wait:
    - name: service.restart
    - m_name: {{ firehol.service }}
    - require:
      - service: firehol-service
