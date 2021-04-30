# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import GRAFANA with context %}

redis-image-present:
  cmd.run:
    - name: podman pull {{ GRAFANA.redis.image.name }}
    - retry:
        attempts: 10
        interval: 5
        until: true
    - runas: {{ GRAFANA.hostuser.name }}

redis-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - grafana.service.redis.destroy

redis-pod-running:
  cmd.run:
    - name: podman play kube --network=grafananet redis-pod.yaml
    - cwd: /opt/grafana
    - runas: {{ GRAFANA.hostuser.name }}
    - require:
      - cmd: redis-image-present
      - module: redis-pod-destroy-if-exists
