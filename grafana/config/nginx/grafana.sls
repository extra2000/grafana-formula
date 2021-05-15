# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import GRAFANA with context %}

/opt/nginx/conf.d/{{ GRAFANA.projectname }}-grafana.conf:
  file.managed:
    - source: salt://grafana/files/nginx/grafana.conf
    - template: jinja
    - context:
      port: {{ GRAFANA.grafana.port }}
