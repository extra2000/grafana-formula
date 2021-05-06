# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import GRAFANA with context %}

{% if GRAFANA.hostuser.name == 'root' %}
  {% set cni_path = '/etc/cni/net.d/' %}
{% else %}
  {% set cni_path = '/home/' + GRAFANA.hostuser.name + '/.config/cni/net.d' %}
{% endif %}

/opt/grafana:
  file.directory:
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}

{{ cni_path }}:
  file.directory:
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}
    - makedirs: true

{{ cni_path }}/podman-network-grafananet.conflist:
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
      projectname: {{ GRAFANA.projectname }}
      grafana: {{ GRAFANA.grafana }}

/opt/grafana/mysql-pod.yaml:
  file.managed:
    - source: salt://grafana/files/mysql-pod.yaml
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}
    - template: jinja
    - context:
      projectname: {{ GRAFANA.projectname }}
      mysql: {{ GRAFANA.mysql }}

/opt/grafana/redis-pod.yaml:
  file.managed:
    - source: salt://grafana/files/redis-pod.yaml
    - user: {{ GRAFANA.hostuser.name }}
    - group: {{ GRAFANA.hostuser.group }}
    - template: jinja
    - context:
      projectname: {{ GRAFANA.projectname }}
      redis: {{ GRAFANA.redis }}
