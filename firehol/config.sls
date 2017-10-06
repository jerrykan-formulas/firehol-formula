{%- from "firehol/map.jinja" import firehol with context -%}

include:
  - firehol

firehol-config-file:
  file.managed:
    - name: {{ firehol.config_file }}
    - source: {{ firehol.firehol_conf_src }}
    - template: jinja
    - require:
      - pkg: firehol-package
    - watch_in:
      - module: firehol-restart

firehol-default-file:
  file.managed:
    - name: {{ firehol.default_file }}
    - source: {{ firehol.defaults_firehol_src }}
    - template: jinja
    - require:
      - pkg: firehol-package
    - watch_in:
      - module: firehol-restart
