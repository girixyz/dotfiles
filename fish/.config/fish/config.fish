source /usr/share/cachyos-fish-config/cachyos-config.fish
  export LC_ALL="en_IN.utf8"
  export LANG="en_IN.utf8"

  function push_dots
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
