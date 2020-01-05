#!/bin/sh

function dev_tools() {
    echo "\ndevelopment tools by Homebrew..."
    brew $1 tree
    brew $1 tig
    brew $1 wget
    brew $1 git
    brew $1 go
    brew $1 peco
    brew $1 ghq
    brew $1 bash-completion
    brew $1 reattach-to-user-namespace
    brew $1 gibo
    brew $1 tmux
    brew $1 ag
    brew $1 jq
}

function _main() {
    case $2 in
        "dev_tools")
            dev_tools $1
    esac

}

_main $1 $2
