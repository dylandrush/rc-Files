TERM=xterm-256color

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char

autoload -U colors && colors

export BROWSER="firefox"
export EDITOR=/usr/local/bin/vim

alias ls="ls --color -F"

function cls(){
    clear && ls
}

function cs(){
	cd "$@" && ls
}

function bldsys1(){
	ssh -X ssdl-bldsys1
}

## Completions
autoload -U compinit
compinit -C
## completions ####
autoload -U zstyle+
## General completion technique
## complete as much u can ..
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
## complete less
#zstyle ':completion:*' completer _expand _complete _list _ignored _approximate
## complete minimal
#zstyle ':completion:*' completer _complete _ignored

## allow one error
#zstyle ':completion:*:approximate:*' max-errors 1 numeric
## allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
			 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

## formatting and messages
			 zstyle ':completion:*' verbose yes
			 zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}%d%{\e[0m%}'
			 zstyle ':completion:*:messages' format $'%{\e[0;31m%}%d%{\e[0m%}'
			 zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for: %d%{\e[0m%}'
			 zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
			 zstyle ':completion:*' group-name ''

## determine in which order the names (files) should be
## listed and completed when using menu completion.
## `size' to sort them by the size of the file
## `links' to sort them by the number of links to the file
## `modification' or `time' or `date' to sort them by the last modification time
## `access' to sort them by the last access time
## `inode' or `change' to sort them by the last inode change time
## `reverse' to sort in decreasing order
## If the style is set to any other value, or is unset, files will be
## sorted alphabetically by name.
			 zstyle ':completion:*' file-sort name

## how many completions switch on menu selection
## use 'long' to start menu compl. if list is bigger than screen
## or some number to start menu compl. if list has that number
## of completions (or more).
			 zstyle ':completion:*' menu select=long

## case-insensitive (uppercase from lowercase) completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## case-insensitive (all) completion
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word and then substring completion
			 zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## offer indexes before parameters in subscripts
			 zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

## insert all expansions for expand completer
			 zstyle ':completion:*:expand:*' tag-order all-expansions

## ignore completion functions (until the _ignored completer)
			 zstyle ':completion:*:functions' ignored-patterns '_*'

## completion caching
			 zstyle ':completion::complete:*' use-cache 1
			 zstyle ':completion::complete:*' cache-path ~/.zcompcache/$HOST

## add colors to completions
			 zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## don't complete backup files as executables
			 zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

## filename suffixes to ignore during completion (except after rm command)
			 zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.(o|c~|old|pro|zwc)'

## add colors to processes for kill completion
			 zstyle ':completion:*:*:kill:*:processes' command 'ps -axco pid,user,command'
			 zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

## Key bindings
			 bindkey "^x^e" expand-cmd-path

## recompile zsh files
			 src ()
{
	autoload -U zrecompile
		[ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
		[ -f ~/.zshenv ] && zrecompile -p ~/.zshenv
		[ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
		[ -f ~/.zlogin ] && zrecompile -p ~/.zlogin
		[ -f ~/.zlogout ] && zrecompile -p ~/.zlogout
		[ -f ~/.zprofile ] && zrecompile -p ~/.zprofile
		[ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old
		[ -f ~/.zshenv.zwc.old ] && rm -f ~/.zshenv.zwc.old
		[ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
		[ -f ~/.zlogin.zwc.old ] && rm -f ~/.zlogin.zwc.old
		[ -f ~/.zlogout.zwc.old ] && rm -f ~/.zlogout.zwc.old
		[ -f ~/.zprofile.zwc.old ] && rm -f ~/.zprofile.zwc.old
}

setopt NO_CASE_GLOB

## Setting the prompt
autoload -U colors && colors
PROMPT="%{$fg[red]%}[%{$reset_color%}%{$fg[blue]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$fg[red]%}]%{$fg_no_bold[yellow]%}%~%{$reset_color%}"$'\n'"%# "

##Setting the prompt
#RPROMPT='[%2c]'

export LD_LIBRARY_PATH=/EGSE/ops/eTSO/lib:/EGSE/ops/eCUT/lib:$LD_LIBRARY_PATH

## see the process for CSIM
function csimid(){
	ps -ef | grep sim
}

## cd to ETSO
function etso(){
	cd /EGSE/ops/eTSO/
}

function bldsys1(){
	ssh -X ssdl-bldsys1
}
