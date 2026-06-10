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


