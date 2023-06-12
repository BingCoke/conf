#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3
source ~/.profile
this=_resource
s2d_reset="^d^"
color="^c#bbbbbb^^b#222222^"
signal=$(echo "^s$this^" | sed 's/_//')
main () {
    STOUSED=$(df -h | grep '/home$' | awk '{print $3}')
    STOTOT=$(df -h | grep '/home$' | awk '{print $2}')
    STOPER=$(df -h | grep '/home$' | awk '{print $5}')
    text="   $STOUSED/$STOTOT:$STOPER"
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s%s'\n" $this "$signal" "$color" "$text |" "$s2d_reset" >> $DWM/statusbar/temp
}


click() {
	 coproc (pcmanfm >/dev/null 2>&1)
}


case $1 in
  click) click $2 ;;
  *) main ;;
esac
