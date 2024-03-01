#!/bin/sh


export LNAG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
COGL_ATLAS_DEFAULT_BLIT_MODE=framebuffer

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#分辨率
#2560x1440
#xrandr --output eDP-1 --mode 2048x1152 --rate 60 --output HDMI-1 --off
# 输入法
# 防止出现问题
# 鼠标
# killall imwheel
# imwheel
#qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct
# java程序
export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit 
wmname LG3D

xrdb ~/.Xresources
# copyq
libinput-libinput-gestures-setup restart
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
# exec bspwm
exec dwm
