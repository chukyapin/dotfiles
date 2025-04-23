fish_config theme choose "Dracula Official"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx TERM xterm-256color

set -gx  EDITOR nvimsx

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 3
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

alias lazygit "TERM=xterm-256color command lazygit"
abbr lg lazygit

# z
#abbr -a cd z

# cat
abbr cat "bat"

# tmux
abbr t 'tmux'
# abbr tc 'tmux attach'
# abbr ta 'tmux attach -t'
# abbr tad 'tmux attach -d -t'
# abbr ts 'tmux new -s'
# abbr tl 'tmux ls'
# abbr tk 'tmux kill-session -t'
# abbr mux tmuxinator

# Files & Directories
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
if command -q "eza"
    abbr -a ls "eza --icons"
    abbr -a ll "eza --color=always --icons --group-directories-first --all --long"
    abbr -a lt "eza --icons --tree"
end


#path

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
#set -x PYENV_ROOT $HOME/.pyenv
#set -x PATH  $PYENV_ROOT/bin $PATH
#pyenv init - | source

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH


function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

