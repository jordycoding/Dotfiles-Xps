# Checks if tmux is available
if [ -x $(command -v tmux) ]; then
    # Only runs pfetch when current pane is the only pane in the windows
    if [[ $(tmux list-panes | wc -l) = "1" ]]; then
        pfetch
    fi
else
    pfetch
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"
export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-completions #Completions
#Auto completion
autoload -Uz compinit
compinit

zinit light zsh-users/zsh-autosuggestions #Suggestions based on history and such
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

# Set neovim as default editor
export EDITOR=nvim

path+=('$HOME/.dotnet/tools')
export PATH

#Set up autocomplete menus to navigate with keyboard and such
zstyle ':completion:*' menu
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

zinit light zdharma-continuum/fast-syntax-highlighting #Syntax highlighting
#eval "$(starship init zsh)"
eval $(thefuck --alias)
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
