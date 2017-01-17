#!/usr/bin/env bash

/usr/sbin/ntpd -u ntp:ntp -p /var/run/ntpd.pid -g -n
