#! /bin/bash
source ~/.profile

this=_system
s2d_reset="^d^"
color="^c#bbbbbb^^b#222222^"

main() {
    text="  Arch "
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s'\n" $this "$color" "$text|" "$s2d_reset" >> $DWM/statusbar/temp
}

main
