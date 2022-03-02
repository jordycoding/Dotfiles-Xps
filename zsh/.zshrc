### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit light zsh-users/zsh-completions #Completions
#Auto completion
autoload -Uz compinit
compinit

zinit light zsh-users/zsh-autosuggestions #Suggestions based on history and such
zinit light zdharma/fast-syntax-highlighting #Syntax highlighting
zinit light zsh-users/zsh-history-substring-search #Search history for substrings(up arrow key similar commands thingy)

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


### End of Zinit's installer chunk
eval "$(starship init zsh)"
eval $(thefuck --alias)
pfetch


