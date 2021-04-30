# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import GRAFANA with context %}

/opt/grafana:
  file.directory:
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}

/home/{{ GRAFANA.hostuser.name }}/.config/cni/net.d:
  file.directory:
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}
    - makedirs: true

/home/{{ GRAFANA.hostuser.name }}/.config/cni/net.d/podman-network-grafananet.conflist:
  file.managed:
    - source: salt://grafana/files/podman-network-grafananet.conflist.jinja
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}
    - template: jinja
    - context:
      pod: {{ GRAFANA.pod }}

/opt/grafana/grafana-pod.yaml:
  file.managed:
    - source: salt://grafana/files/grafana-pod.yaml
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}
    - template: jinja
    - context:
      grafana: {{ GRAFANA.grafana }}

/opt/grafana/mysql-pod.yaml:
  file.managed:
    - source: salt://grafana/files/mysql-pod.yaml
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}
    - template: jinja
    - context:
      mysql: {{ GRAFANA.mysql }}

/opt/grafana/redis-pod.yaml:
  file.managed:
    - source: salt://grafana/files/redis-pod.yaml
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}
    - template: jinja
    - context:
      redis: {{ GRAFANA.redis }}
