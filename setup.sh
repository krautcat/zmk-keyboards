#!/usr/bin/env bash

main() {
    local _scriptdir
    _scriptdir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd )"

    declare -A _keymaps
    _keymaps[ladniy_customs/tk44]="tk44.keymap"

    for keyboard in "${!_keymaps[@]}"; do
        ln -sf \
            "$(realpath "$_scriptdir/$keyboard/${_keymaps[keyboard]}")" \
            "$(realpath "$_scriptdir/../zmk-config/$keyboard/config/${_keymaps[$keyboard]}")"
    done
}

main "$@"
