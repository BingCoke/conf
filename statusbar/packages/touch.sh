#!/bin/bash
source ~/.profile

this=_touch
s2d_reset="^d^"
signal=$(echo "^s$this^" | sed 's/_//')
STATE=0
icon=ﳶ
text=""
ID=`xinput list | grep -Eio '(touchpad|glidepoint)\s*id=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
main(){
  declare -i ID
  if [ $STATE -eq 1 ]
  then
    text=" on"
  else
    text="off"
  fi
    text=" $icon $text"
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s%s'\n" $this "$signal" "$color" "|$text |" "$s2d_reset" >> $DWM/statusbar/temp
}
click(){
  if [ $STATE -eq 1 ]
  then
    xinput disable $ID
    echo "Touchpad disabled."
  else
    xinput enable $ID
    echo "Touchpad enabled."
  fi
}

case $1 in
  click) click $2 ;;
  *) main ;;
esac
