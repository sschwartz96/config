# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### .zshrc stuff
autoload -U colors && colors

# auto complete
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # includes hidden files


# Vi mode
bindkey -v
export KEYTIMEOUT=1 # changes the lag time switching mode
# Change cursor shape for different vi modes.
# Change cursor shape for different vi modes.
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		[[ $1 = 'block' ]]; then
			echo -ne '\e[1 q'

		elif [[ ${KEYMAP} == main ]] ||
			[[ ${KEYMAP} == viins ]] ||
			[[ ${KEYMAP} = '' ]] ||
			[[ $1 = 'beam' ]]; then
					echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select

_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)


# change the default 
export PS1='%n:%1d$ '

# color the ls command
alias ls='ls --color'

# set xbps shorcuts
alias xi='sudo xbps-install -S'
alias xu='sudo xbps-install -Su'
alias xr='sudo xbps-remove'
alias xq='sudo xbps-query -R -s' 

# add ~/bin/ to path
export PATH=$PATH:~/bin/
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/bin/dart-sass
export PATH=$PATH:~/bin/robo3t/bin

# set term
#export TERM='xterm-256color'

# set myvimrc
export MYVIMRC="~/.config/nvim"

# go project vars
export MOPS=~/go/src/github.com/sschwartz96/m-ops.org/

# cd into home
cd ~

# aliases 
alias vim='nvim'

# fzf bash 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# syntax
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
