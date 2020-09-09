#
# ~/.zshrc 
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

########## zsh stuff ########## 
autoload -U colors && colors

# auto complete
setopt auto_cd
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
# alacritty
alias ala='alacritty'
########## END aliases ########## 


########## variables ########## 
export PS1='%n:%1d$ '

# path additions
export PATH=$PATH:~/bin/
export PATH=$PATH:~/go/bin			# used for vim-go
export PATH=$PATH:~/bin/dart-sass
export PATH=$PATH:~/bin/robo3t/bin
export PATH=$PATH:~/bin/brave
export PATH=$PATH:~/src/flutter/bin
export PATH=$PATH:~/src/android-studio/bin
export PATH=$PATH:~/src/android-studio/jre
#for python-pip
export PATH=$PATH:/home/sam/.local/bin


# VARIABLES 
export MYVIMRC="~/.config/nvim"
export MOPS=~/go/src/github.com/sschwartz96/m-ops.org/
export GOREP=~/go/src/github.com/sschwartz96
export SYNCAPOD=~/go/src/github.com/sschwartz96/syncapod
export BROWSER="/home/sam/bin/chrome"
export TERM="alacritty"
export EDITOR="nvim"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# for android-studio, prevent blank startup
export _JAVA_AWT_WM_NONREPARENTING=1
# for sdkmanager
export JAVA_HOME=~/src/android-studio/jre
# for debug on android device
export NO_PROXY=localhost,127.0.0.1
# for flutter web development
export CHROME_EXECUTABLE=chrome

########## END variables ########## 


# fzf
#export FZF_DEFAULT_COMMAND="find -L" # finds hidden files too
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh syntax
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# cd into home
cd ~
