#!/bin/bash

options="Poweroff (p)\nReboot (r)\nHibernate (h)\nSuspend (s)\nLock (l)"
chosen=$(echo -e $options | dmenu -p "System:" -fn 'monospace:size=12' -nb '#1c1c1c' -nf '#dcdccc' -sb '#6f6f6f' -sf '#dcdccc')

case "$chosen" in
    *p*) /home/dede/.config/i3/poweroff.sh ;;
    *r*) /home/dede/.config/i3/reboot.sh ;;
    *h*) /home/dede/.config/i3/hibernate.sh ;;
    *s*) /home/dede/.config/i3/sleep.sh ;;
    *l*) /home/dede/.config/i3/lock.sh ;;
    *)   exit 1 ;;
esac
