#!/bin/sh
service dbus start
bluetoothd -n

python "src/$1.py"