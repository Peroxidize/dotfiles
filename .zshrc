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
compinit
# End of lines added by compinstall

alias sdu="sudo dnf update"
alias dca="dnf clean all" 

alias ga="git add"
alias gs="git status"
alias gp="git push"
alias gc="git commit -m"

# Guide used: https://thevaluable.dev/zsh-install-configure-mouseless/
export EDITOR="nvim"
export VISUAL="nvim"
export KEYTIMEOUT=1

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


# JUMP PLUGIN: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/jump/jump.plugin.zsh

# Easily jump around the file system by manually adding marks
# marks are stored as symbolic links in the directory $MARKPATH (default $HOME/.marks)
#
# jump FOO: jump to a mark named FOO
# mark FOO: create a mark named FOO
# unmark FOO: delete a mark
# marks: lists all marks
#
export MARKPATH=$HOME/.marks


jump() {
	local markpath="$(readlink $MARKPATH/$1)" || {echo "No such mark: $1"; return 1}
	builtin cd "$markpath" 2>/dev/null || {echo "Destination does not exist for mark [$1]: $markpath"; return 2}
}

mark() {
	if [[ $# -eq 0 || "$1" = "." ]]; then
		MARK=${PWD:t}
	else
		MARK="$1"
	fi
	if read -q "?Mark $PWD as ${MARK}? (y/n) "; then
		command mkdir -p "$MARKPATH"
		command ln -sfn "$PWD" "$MARKPATH/$MARK"
	fi
}

unmark() {
	LANG= command rm -i "$MARKPATH/$1"
}

marks() {
	local link max=0
	for link in $MARKPATH/{,.}*(@N); do
		if [[ ${#link:t} -gt $max ]]; then
			max=${#link:t}
		fi
	done
	local printf_markname_template="$(printf -- "%%%us" "$max")"
	for link in $MARKPATH/{,.}*(@N); do
		local markname="$fg[cyan]$(printf -- "$printf_markname_template" "${link:t}")$reset_color"
		local markpath="$fg[blue]$(readlink $link)$reset_color"
		printf -- "%s -> %s\n" "$markname" "$markpath"
	done
}

_completemarks() {
	reply=("${MARKPATH}"/{,.}*(@N:t))
}
compctl -K _completemarks jump
compctl -K _completemarks unmark

_mark_expansion() {
	setopt localoptions extendedglob
	autoload -U modify-current-argument
	modify-current-argument '$(readlink "$MARKPATH/$ARG" || echo "$ARG")'
}
zle -N _mark_expansion
bindkey "^g" _mark_expansion

###################################################################################

if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

eval "$(starship init zsh)"
