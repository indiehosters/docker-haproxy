#!/bin/bash -eux

HAPROXY_PATH=/etc/haproxy
cd $HAPROXY_PATH

trap exit SIGHUP SIGTERM SIGINT

haproxy -f $HAPROXY_PATH/haproxy.cfg -D -p /var/run/haproxy.pid

while true; do
  inotifywait -r .
  haproxy -f $HAPROXY_PATH/haproxy.cfg -D -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid)
done
