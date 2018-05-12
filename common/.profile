#!/bin/bash

## source this file from .bashrc/.zshrc with:
## [[ -r ~/.profile ]] && . ~/.profile

export EDITOR=vim
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/usr/bin:$HOME/.local/usr/local/bin:$PATH

# ls colors

if [[ "$(uname)" == 'Linux' ]]; then
    alias ls='ls --color=auto'
fi

# Emacs ansi-term directory tracking
# https://www.emacswiki.org/emacs/AnsiTermHints#toc5

set_eterm_dir() {
    echo -e "\033AnSiTu" "$LOGNAME"
    echo -e "\033AnSiTh" "$(hostname)"
    echo -e "\033AnSiTc" "$(pwd)"
}

#if [ -n "$INSIDE_EMACS" ]; then
if [ "$TERM" = "eterm-color" ]; then
    # bash
    PROMPT_COMMAND=set_eterm_dir
    # zsh
    precmd_functions=($precmd_functions set_eterm_dir)
fi

## fixes broken term-send-backspace in emacs term in OSX
if [[ -n $INSIDE_EMACS && $(uname) == 'Darwin' ]]; then
    stty ek
    ## alternate solution:
    #stty erase 
fi
