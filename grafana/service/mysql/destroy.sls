# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import GRAFANA with context %}

mysql-pod-destroy:
  cmd.run:
    - name: podman pod rm --force {{ GRAFANA.projectname }}-mysql-pod
    - runas: {{ GRAFANA.hostuser.name }}
