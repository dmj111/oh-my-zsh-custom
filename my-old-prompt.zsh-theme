
# prompt influenced by
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/


function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '(g)' && return
    hg root >/dev/null 2>/dev/null && echo '(h)' && return
    echo '( )'
}

export VIRTUAL_ENV_DISABLE_PROMPT=disable
autoload -Uz vcs_info

# enable only these version control systems...
zstyle ':vcs_info:*' enable git hg svn



precmd () {
  setopt noxtrace noksharrays localoptions
  local exitstatus=$?
  local git_dir git_ref venv

  psvar=()
  venv=''
  [[ -x $VIRTUAL_ENV ]] && venv=`basename $VIRTUAL_ENV`
  # echo $venv
  psvar[1]="<$venv>"
  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[2]="$vcs_info_msg_0_"
}
# add-zsh-hook precmd prompt_precmd

# print Ding! on the hour.
PS1='%F{green}%B** [%(0t.Ding!.%T)] [%n@%m ] **
%~
%1v%U%2v%u %f$%b '

# This message is for emacs...
# Local Variables:
# mode: shell-script
# End:
