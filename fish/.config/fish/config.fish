source /usr/share/cachyos-fish-config/cachyos-config.fish
export LC_ALL="en_IN.utf8"
export LANG="en_IN.utf8"

set -gx _JAVA_AWT_WM_NONREPARENTING 1 #jdownloader
set -gx _JAVA_OPTIONS "-Dsun.java2d.uiScale=2" #jdownloader scaling

#neovim default for yazi 
set -gx EDITOR nvim
set -gx VISUAL nvim

function y #yazi default function 
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

function pushdots #function to push my dotfiles to github
    cd ~/dotfiles
    git add .
    if test -n "$argv"
        git commit -m "$argv"
    else
        git commit -m "update dotfiles"
    end
    git push
    cd -
end

function turbo #turbo boost function
    switch "$argv[1]"
        case on
            echo 0 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo >/dev/null
            echo "Turbo Boost: ON"

        case off
            echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo >/dev/null
            echo "Turbo Boost: OFF"

        case qm
            set state (cat /sys/devices/system/cpu/intel_pstate/no_turbo)

            if test "$state" = 0
                echo "Turbo Boost: ON"
            else
                echo "Turbo Boost: OFF"
            end

        case '*'
            echo "Usage: turbo [on|off|status]"
    end
end
