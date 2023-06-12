#!/bin/sh

sudo sed -i "s/^Exec.*$/ExecStart=-\/sbin\/agetty -o '-p -f bk' -n -a bk --noclear %I \$TERM/g"   /etc/systemd/system/getty.target.wants/getty@tty1.service &> /dev/null
