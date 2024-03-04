if status is-interactive
  # Commands to run in interactive sessions can go here
end

#set -xg LANG zh_CN.UTF-8

set -g fish_greeting 
alias ll 'exa -lg --icons'
alias ls 'exa --icons'
alias l 'exa --icons'
alias lg='lazygit'
alias s='neofetch'
alias te='trans'
alias tes='trans --sp'
alias tz='trans :en'
alias tec='trans --shell'
alias tzc='trans :en --shell'
alias hx="helix"
alias icat="kitty +kitten icat"
alias ra="ranger"
alias ksh="kitty +kitten ssh"
alias snvm="source /usr/share/nvm/init-nvm.sh"

set -gx $EDITOR "nvim"

set -x myconf /home/bk/mygithub/conf
set -x VISUAL nvim
set -x UNZIP "-O CP936"
set -x BUN_INSTALL "/home/bk/.bun"
set -x PATH /home/bk/.local/bin/flutter/bin $BUN_INSTALL/bin /home/bk/.yarn/bin/ /home/bk/.cargo/bin/ /home/bk/.local/bin /home/bk/go/bin /home/bk/Android/Sdk/platform-tools /home/bk/Android/Sdk/emulator $PATH
set -x ANDROID_HOME ~/Android/Sdk 
set -x GOPATH /home/bk/go
set -xg JAVA_HOME /lib/jvm/default

#export http_proxy='http://127.0.0.1:2081'
#export https_proxy='http://127.0.0.1:2081'
export http_proxy='http://127.0.0.1:7897'
export https_proxy='http://127.0.0.1:7897'
export no_proxy='localhost,127.0.0.0/8,192.168.0.0/16,::1,127.0.0.1'


set -xg TERM xterm-256color
export CHROME_EXECUTABLE=google-chrome-stable
# bun completions

set -x PUB_HOSTED_URL https://pub.flutter-io.cn;
set -x FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn

# for bun
source $HOME/.bun/bun.fish
export EXPO_EDITOR=kitty

bind \co execute

bind \cj down-or-search
bind \ck up-or-search

function ya
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end


set -xg QtVersion 5.15.8
#qt5ct
set -xg QT_QPA_PLATFORMTHEME qt5ct
set -xg GDK_BACKEND wayland
# java程序
export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit
wmname LG3D

export LNAG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

source $HOME/.config/fish/color.fish

[ $(tty) = "/dev/tty1" ] && cd ~ && Hyprland;

starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/bk/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda/bin/conda
  #eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

