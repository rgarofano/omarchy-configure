#!/usr/bin/env bash

if [[ ! -f "main.bash" ]]; then
    echo "This script must be run in the root directory where 'main.bash' resides"     
    exit 1
fi

source ./keyboard/remaps.bash
source ./keyboard/bindings.bash
source ./shell/zsh.bash
source ./editor/neovim.bash
source ./editor/lsp.bash
source ./dev/ruby.bash

# These require user input
source ./ssh/setup_ssh.bash
source ./dev/github.bash
