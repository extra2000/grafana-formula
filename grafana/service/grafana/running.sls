# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import GRAFANA with context %}

grafana-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - grafana.service.grafana.destroy

grafana-containers-running:
  cmd.run:
    - name: podman play kube --network=grafananet grafana-pod.yaml
    - cwd: /opt/grafana
    - runas: {{ GRAFANA.hostuser.name }}
    - require:
      - module: grafana-pod-destroy-if-exists
