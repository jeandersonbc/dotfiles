get_sha() {
    git rev-parse --short HEAD 2>/dev/null
}

GIT_PS1_FILE="`find / -name git-prompt.sh 2>/dev/null | head -n 1`"
if [ -f $GIT_PS1_FILE ]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWCOLORHINTS=1
    GIT_PS1_DESCRIBE_STYLE="branch"
    GIT_PS1_SHOWUPSTREAM="auto git"

    source $GIT_PS1_FILE

    export PROMPT_COMMAND='__git_ps1 "\u@\h \w" "\n\$ " " (%s) $(get_sha)"'
fi
