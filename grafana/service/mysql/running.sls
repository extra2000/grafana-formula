# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import GRAFANA with context %}

mysql-image-present:
  cmd.run:
    - name: podman pull {{ GRAFANA.mysql.image.name }}
    - retry:
        attempts: 10
        interval: 5
        until: true
    - runas: {{ GRAFANA.hostuser.name }}

mysql-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - grafana.service.mysql.destroy

mysql-pod-running:
  cmd.run:
    - name: podman play kube --network=grafananet mysql-pod.yaml
    - cwd: /opt/grafana
    - runas: {{ GRAFANA.hostuser.name }}
    - require:
      - cmd: mysql-image-present
      - module: mysql-pod-destroy-if-exists
