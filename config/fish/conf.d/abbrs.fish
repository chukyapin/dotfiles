abbr --add gco 'git checkout'
abbr --add gst 'git status'
abbr --add gl 'git log --oneline --graph --decorate'

# Tmux
abbr t tmux
abbr tc 'tmux attach'
abbr ta 'tmux attach -t'
abbr tad 'tmux attach -d -t'
abbr ts 'tmux new -s'
abbr tl 'tmux ls'
abbr tk 'tmux kill-session -t'

# Files & Directories
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
alias tree "eza --icons -T --no-user"
alias ls "eza --color=always --icons --group-directories-first"
alias la 'eza --color=always --icons --group-directories-first --all'
alias ll 'eza --color=always --icons --group-directories-first --all --long'
abbr l ll
abbr lg lazygit
abbr ld lazydocker
abbr j z 
abbr ji zi 
abbr ncdu "ncdu --color dark"

# Editor
abbr vim nvim
abbr vi nvim
abbr v nvim
alias lazyvim "NVIM_APPNAME=lazyvim nvim"
abbr lv lazyvim

abbr oo "$HOME/Documents/Zettelkasten/Literature_Note/"
