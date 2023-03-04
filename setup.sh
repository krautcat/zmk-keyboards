#!/usr/bin/env bash

main() {
    local _scriptdir
    _scriptdir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd )"

    local _keyboards=("ladniy_customs/tk44")
    local _keymaps=("tk44.keymap")

    for i in "${!_keyboards[@]}"; do
        ln -sf \
            "$(realpath "$_scriptdir/${_keyboards[i]}")" \
            "$(realpath "$_scriptdir/../zmk-config/${_keyboards[i]}/${_keymaps[i]})"
    done
}

main "$@"
