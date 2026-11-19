#!/bin/dash
set -eu
ROOT=$(CDPATH= cd -P "$(dirname "$0")/.." && pwd)
TMP_ROOT=${TMPDIR:-/tmp}/dotfiles-roundtrip.$$
trap 'rm -rf "$TMP_ROOT"' EXIT HUP INT TERM
run_file_case() {
    test_home=$TMP_ROOT/files/home; test_state=$TMP_ROOT/files/state
    mkdir -p "$test_home/.config/kitty"
    printf 'old profile\n' > "$test_home/.profile"
    printf 'old kitty\n' > "$test_home/.config/kitty/kitty.conf"
    HOME=$test_home XDG_STATE_HOME=$test_state /bin/dash "$ROOT/apply" --profile common
    [ -L "$test_home/.profile" ] && [ -L "$test_home/.config/kitty/kitty.conf" ]
    HOME=$test_home XDG_STATE_HOME=$test_state /bin/dash "$ROOT/revert"
    [ "$(cat "$test_home/.profile")" = 'old profile' ]
    [ "$(cat "$test_home/.config/kitty/kitty.conf")" = 'old kitty' ]
}
run_directory_symlink_case() {
    test_home=$TMP_ROOT/directory/home; test_state=$TMP_ROOT/directory/state; legacy=$TMP_ROOT/directory/legacy-nvim
    mkdir -p "$test_home/.config" "$legacy"; printf 'legacy init\n' > "$legacy/init.lua"; ln -s "$legacy" "$test_home/.config/nvim"
    HOME=$test_home XDG_STATE_HOME=$test_state /bin/dash "$ROOT/apply" --profile minimal
    [ -d "$test_home/.config/nvim" ] && [ ! -L "$test_home/.config/nvim" ]
    HOME=$test_home XDG_STATE_HOME=$test_state /bin/dash "$ROOT/revert"
    [ -L "$test_home/.config/nvim" ] && [ "$(cat "$test_home/.config/nvim/init.lua")" = 'legacy init' ]
}
run_dry_run_case() {
    test_home=$TMP_ROOT/dry-run/home; test_state=$TMP_ROOT/dry-run/state
    mkdir -p "$test_home"; printf 'untouched\n' > "$test_home/.profile"
    HOME=$test_home XDG_STATE_HOME=$test_state /bin/dash "$ROOT/apply" --profile minimal --dry-run >/dev/null
    [ "$(cat "$test_home/.profile")" = 'untouched' ] && [ ! -e "$test_state/dotfiles/manifest" ]
}
run_restore_conflict_case() {
    test_home=$TMP_ROOT/conflict/home; test_state=$TMP_ROOT/conflict/state
    mkdir -p "$test_home"; printf 'original\n' > "$test_home/.profile"
    HOME=$test_home XDG_STATE_HOME=$test_state /bin/dash "$ROOT/apply" --profile minimal
    rm "$test_home/.profile"; printf 'new local file\n' > "$test_home/.profile"
    if HOME=$test_home XDG_STATE_HOME=$test_state /bin/dash "$ROOT/revert" >/dev/null 2>&1; then printf 'revert unexpectedly overwrote a restore conflict\n' >&2; return 1; fi
    [ "$(cat "$test_home/.profile")" = 'new local file' ] && [ -f "$test_state/dotfiles/manifest" ]
}
run_file_case; run_directory_symlink_case; run_dry_run_case; run_restore_conflict_case
printf 'round-trip tests passed\n'
