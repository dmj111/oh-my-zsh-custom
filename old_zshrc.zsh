# Use "set -x" to make verbose what zsh is really doing.
# set -x

# Order of startup files:
#   - zshenv (unless -f)
#   - zprofile (login shells)
#   - zshrc  (interactive shells)
#   - zlogin (interactive shells)


# TODO: unused?
# search path for zsh functions
# fpath=($HOME/lib/zsh $fpath)
# typeset -U fpath

# Load some aliase and functions common to both bash and zsh.
# TODO: i never use bash anymore... drop these?

. ~/config/functions

# Don't automatically kill background jobs on exit.
setopt no_hup


# Better run-help # TODO really?
autoload -U run-help
#
# Power Options
#
setopt auto_list 


# Some convenient aliases.
# Start an emacs client in the terminal.
alias e="emacsclient -t"

# Start an emacs client in a graphical window.
alias ec="emacsclient -c"

alias l="less"


# TODO: doesn't work on mac!
alias duck="du -ck --max-depth=1 ./ | sort -rn | head -n 16"

alias ls="ls -F"
# alias s="ssh -AX "



# not sure what this is for anymore... 
# 04/27/2010  
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' accept-exact '*(N)'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions'  format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'no matches for: %d'
zstyle ':completion:*' group-name ''

# # If I ever do my own completion, this will reload all functions
# # under the function directory.
# reloadc () {
#     local f
#     f=(~/config/zsh/*(.))
#     unfunction $f:t 2> /dev/null
#     autoload -U $f:t
# }



# Suffix aliases.  
# for example, "$ a.tex" causes a.tex to open with EDITOR
alias -s tex=$EDITOR
alias -s cc=$EDITOR
alias -s cpp=$EDITOR
alias -s h=$EDITOR

# Don't bother putting this stuff in the history.  Though, it doesn't
# seem to work with extended history anyhow...
export HISTIGNORE="&:ls:exit:l"

# Let programs know what I want for the pager.
export PAGER=less

# Make 'less' use case-insenstive matching, and respect the raw
# control chars.
export LESS="iR"

# Not sure about this one.
# export CDPATH=.

# Not needed
# export SHELL=$(which zsh)
# export PATH=$PATH:$HOME/bin

#
# cd aliases
#

# # Sweet trick from zshwiki.org :-)
# # cd path/to/file => cd path/to
# function cd {
#   if (( $# != 1 )); then
#     builtin cd "$@"
#     return
#   fi

#   if [[ -f "$1" ]]; then
#     builtin cd "$1:h"
#   else
#     builtin cd "$1"
#   fi
# }


#
# Global aliases
# 
alias -g G="|grep"
alias -g L="|less -iR"
alias -g H="|head"
alias -g T="|tail"


#
# no spelling corrections on these things
#
alias man="nocorrect man"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"

# Setup "s" to use ssh's completion.
# compdef _ssh s
    
# stty -ixon

bindkey "\M-p" history-beginning-search-backward
bindkey "\M-n" history-beginning-search-forward
bindkey "\ep" history-beginning-search-backward
bindkey "\en" history-beginning-search-forward

# Make this like my emacs key binding.
bindkey '\C-x\C-w' kill-region


# typeset -U my_accounts
# typeset -U my_hosts
# typeset -U my_users 

# Load private files...
# [[ -r ~/config/local/.zshrc ]] && source ~/config/local/.zshrc 
[[ -r ~/.zshrc.private ]] && source ~/.zshrc.private


if [[ -d $HOME/priv/config/zsh ]]; then
    for file ($HOME/priv/config/zsh/*.zsh)
        source $file
fi

if [ -d ~/config/zsh ]; then
    for f in ~/config/zsh/*.zsh ; do
        [[ -r $f ]] && source $f
    done
fi

# From https://github.com/justinlilly/jlilly-bashy-dotfiles/.
# Automatically activate a virtual environment, if this file exists.

# has_virtualenv() {
#     if [ -e .venv ]; then
#         workon `cat .venv`
#     fi
# }

# venv_cd () {
#     builtin cd "$@" && has_virtualenv
# }

# alias cd="venv_cd"





# This message is for emacs...
# Local Variables:
# mode: shell-script
# End:
