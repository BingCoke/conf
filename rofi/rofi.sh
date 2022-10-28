#! /bin/sh
echo -en "\0prompt\x1fmenu\n"
echo -en "\0data\x1f\n"
menu=$ROFI_DATA
case "$menu" in
"")
    case "$*" in
    "yacd")
        $myconf/rofi/app/yacd.sh
    exit 0
    ;;
    "mount")
        $myconf/rofi/mount.sh
    ;;
    "backgroud")
    feh --bg-fill --randomize ~/tools/wallpaper/*.png
    ;;
    "")
    echo "yacd"
    echo "mount"
    echo "backgroud"
    ;;
    *)
    exit 0
    esac
    ;;
"mount") 
    $myconf/rofi/mount.sh $*
esac


