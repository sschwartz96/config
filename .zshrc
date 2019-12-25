#
# ~/.zshrc 
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

########## zsh stuff ########## 
autoload -U colors && colors

# auto complete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # corrects capitalization
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

##########  END zsh stuff ########## 


########## aliases ########## 
alias ls='ls --color=auto'
alias vim='nvim'
# arch-based
alias pi='sudo pacman -S'
alias pr='sudo pacman -Rs'
alias pu='sudo pacman -Syu'
alias pq='sudo pacman -Ss'
# void 
alias xi='sudo xbps-install -S'
alias xu='sudo xbps-install -Su'
alias xr='sudo xbps-remove'
alias xq='sudo xbps-query -R -s' 
########## END aliases ########## 


########## variables ########## 
export PS1='%n:%1d$ '

# path additions
export PATH=$PATH:~/bin/
export PATH=$PATH:/usr/local/go/bin # golang install
export PATH=$PATH:~/go/bin			# used for vim-go
export PATH=$PATH:~/bin/dart-sass
export PATH=$PATH:~/bin/robo3t/bin


# VARIABLES 
export MYVIMRC="~/.config/nvim"
export MOPS=~/go/src/github.com/sschwartz96/m-ops.org/
#export TERM='xterm-256color'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

########## END variables ########## 


# fzf
#export FZF_DEFAULT_COMMAND="find -L" # finds hidden files too
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh syntax
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# cd into home
cd ~
