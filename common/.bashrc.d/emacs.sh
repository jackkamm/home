## enable directory tracking in emacs term
## http://stackoverflow.com/a/10050104/3718509
#if [ -n "$INSIDE_EMACS" ]; then
if [ "$TERM" = "eterm-color" ]; then
    # function to set the dired and host for ansiterm
    set_eterm_dir() {
        # following are needed to reset username/host
        # in case they have been changed in ssh session
        print -P "\033AnSiTu %n"
        print -P "\033AnSiTh" "$(hostname -f)"
        # set ansiterm dired
        print -P "\033AnSiTc %d"
    }

    # call prmptcmd whenever prompt is redrawn
    precmd_functions=($precmd_functions set_eterm_dir)
fi

## fixes broken term-send-backspace in emacs term in OSX
if [[ -n $INSIDE_EMACS && $(uname) == 'Darwin' ]]; then
    stty ek
    ## alternate solution:
    #stty erase 
fi