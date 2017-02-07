{%- from "firehol/map.jinja" import firehol with context -%}

include:
  - firehol

firehol-config-file:
  file.managed:
    - name: {{ firehol.config_file }}
    - source: salt://firehol/files/firehol.conf.jinja
    - template: jinja
    - require:
      - pkg: firehol-package
    - watch_in:
      - module: firehol-restart

firehol-default-file:
  file.managed:
    - name: {{ firehol.default_file }}
    - source: salt://firehol/files/default_firehol.jinja
    - template: jinja
    - require:
      - pkg: firehol-package
    - watch_in:
      - module: firehol-restart
