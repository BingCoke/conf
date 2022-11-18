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
			"clash")
				$myconf/rofi/app/clash.sh
				;;
			"backgroud")
				feh --bg-fill --randomize ~/tools/wallpaper/*.png
				;;
			"flush-clash")
				/home/bk/scripts/autodonwload.sh flush
				notify-send "flush" -t 5000
				;;
			"modmap")
				[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
				;;
			"ranger")
				coproc (st -c float -e ranger >/dev/null 2>&1)
				;;
      "screen-one")
        xrandr --output eDP-1 --mode 2048x1152 --rate 60 --output HDMI-1 --off
        feh --bg-fill --randomize ~/tools/wallpaper/*.png
        ;;
      "screen-two")
        xrandr --output eDP-1 --mode 2048x1152 --rate 60 --output HDMI-1 --auto 
        feh --bg-fill --randomize ~/tools/wallpaper/*.png
        ;;
			"")
				echo "yacd"
				echo "mount"
				echo "backgroud"
				echo "clash"
				echo "flush-clash"
				echo "modmap"
				echo "ranger"
        echo "screen-one"
        echo "screen-two"
				;;
			*)
				exit 0
		esac
		;;
	"mount") 
		$myconf/rofi/mount.sh $*
		;;
	"tran")
		$myconf/rofi/app/tran.sh $*
		;;
	"clash")
		$myconf/rofi/app/clash.sh $*
		;;
esac

