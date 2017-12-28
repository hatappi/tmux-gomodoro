#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

remain="#($CURRENT_DIR/scripts/remain.sh)"
gomodoro_remain_interpolation_string="\#{gomodoro_remain}"

source $CURRENT_DIR/scripts/helpers.sh

do_interpolation() {
	local string="$1"
	local interpolated="${string/$gomodoro_remain_interpolation_string/$remain}"
	echo "$interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
