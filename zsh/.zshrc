if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh
zpm load @github/zsh-users/zsh-completions #Completions
#Auto completion
autoload -Uz compinit
compinit

zpm load @github/zsh-users/zsh-autosuggestions #Suggestions based on history and such
zpm load @github/zsh-users/zsh-syntax-highlighting #Syntax highlighting
zpm load @github/zsh-users/zsh-history-substring-search #Search history for substrings(up arrow key similar commands thingy)

#History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#Set up history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

#Command history and autocompletion for history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

#Few productivity tweaks
setopt auto_cd
setopt correct_all
setopt auto_list
setopt auto_menu
setopt always_to_end # move cursor to end if word had one match

#Set up autocomplete menus to navigate with keyboard and such
zstyle ':completion:*' menu
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

eval "$(starship init zsh)"
eval $(thefuck --alias)
pfetch
