source /usr/share/cachyos-fish-config/cachyos-config.fish
  export LC_ALL="en_IN.utf8"
  export LANG="en_IN.utf8"

  function pushdots
    cd ~/dotfiles
    git add .
    # If you don't type a message, it defaults to "update dotfiles"
    if test -n "$argv"
        git commit -m "$argv"
    else
        git commit -m "update dotfiles"
    end
    git push
    cd -
end

function turbo
    set current (cat /sys/devices/system/cpu/cpufreq/boost)
    if test $current -eq 1
        echo 0 | sudo tee /sys/devices/system/cpu/cpufreq/boost
        echo "Turbo boost OFF"
    else
        echo 1 | sudo tee /sys/devices/system/cpu/cpufreq/boost
        echo "Turbo boost ON"
    end
end
