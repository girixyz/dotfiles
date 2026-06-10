source /usr/share/cachyos-fish-config/cachyos-config.fish
  export LC_ALL="en_IN.utf8"
  export LANG="en_IN.utf8"

  function pushdots
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

function turbo
    switch "$argv[1]"
        case on
            echo 0 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo >/dev/null
            echo "Turbo Boost: ON"

        case off
            echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo >/dev/null
            echo "Turbo Boost: OFF"

        case status
            set state (cat /sys/devices/system/cpu/intel_pstate/no_turbo)

            if test "$state" = "0"
                echo "Turbo Boost: ON"
            else
                echo "Turbo Boost: OFF"
            end

        case '*'
            echo "Usage: turbo [on|off|status]"
    end
end

