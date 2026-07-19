function a
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_inseert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

# Path
set -e fish_user_paths
# fish_add_path /bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.bun/bin
fish_add_path ~/.local/bin
fish_add_path ~/.luarocks/bin
fish_add_path ~/Library/Python/3.14/bin
fish_add_path /usr/local/opt/sqlite/bin
fish_add_path /usr/local/sbin
fish_add_path ~/.gem/ruby/2.6.0/bin
fish_add_path ~/.local/bin/pnpm-bins
fish_add_path ~/.local/share/bob-nvim/bin
fish_add_path ~/.local/share/bob-nvim/nvim-linux64/bin
fish_add_path /var/lib/flatpak/exports/bin/
fish_add_path ~/.dotnet/tools
fish_add_path ~/.local/share/mise/shims
fish_add_path ~/.local/share/bob/nvim-used/bin

if [ -e ~/.local/share/bob/nvim-used ]
    fish_add_path ~/.local/share/bob/nvim-used/bin
else
    fish_add_path ~/.local/share/bob/nvim-bin/
end

set -gx DENO_INSTALL "~/.deno"
fish_add_path ~/.deno/bin

# set -Ux PATH $HOME/.emacs.d/bin $PATH
fish_add_path ~/.emacs.d/bin

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR


# Fish
set fish_emoji_width 2
alias ssh "TERM=xterm-256color command ssh"
alias mosh "TERM=xterm-256color command mosh"

# Emacs
# set -l emacs_path /Applications/Emacs.app/Contents/MacOS
# set -Ux EMACS $emacs_path/Emacs
fish_add_path ~/.emacs.d/bin
# alias emacs $EMACS

# Go
set -x GOPATH ~/go
fish_add_path $GOPATH $GOPATH/bin

 # Exports
# set -x LESS -rF
# set -x COMPOSE_DOCKER_CLI_BUILD 1
# set -x HOMEBREW_NO_AUTO_UPDATE 1
# set -x DOTDROP_AUTOUPDATE no
# set -x MANPAGER "nvim +Man!"
# set -x MANROFFOPT -c
# set -x OPENCV_LOG_LEVEL ERROR
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" # use bat to format man pages
#set -x MANPAGER "most" # use bat to format man pages
#
abbr -a --position anywhere --set-cursor -- -h "-h 2>&1 | bat --plain --language=help"
