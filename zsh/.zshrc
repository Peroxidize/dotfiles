# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/peroxidize/.zshrc'

autoload -Uz compinit
# End of lines added by compinstall


# Aliases
alias sdu="sudo dnf update"
alias sdi="sudo dnf install"
alias dca="dnf clean all" 

alias ga="git add"
alias gs="git status"
alias gp="git push"
alias gpo="git push origin"
alias gc="git commit -m"
alias gpl="git pull"


# Guide used: https://thevaluable.dev/zsh-install-configure-mouseless/
export EDITOR="nvim"
export VISUAL="nvim"
export KEYTIMEOUT=1

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


# Plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-you-should-use/zsh-you-should-use.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh


if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi


compinit
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
