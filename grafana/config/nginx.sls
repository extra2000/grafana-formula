# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import GRAFANA with context %}

/opt/nginx/https.conf:
  file.managed:
    - source: salt://grafana/files/nginx-https.conf.jinja
    - template: jinja
    - context:
      grafana: {{ GRAFANA.grafana }}
