#
# Copyright (C) 2017 Rodrigo Siqueira  <siqueira@ime.usp.br>
#
# This source code is licensed under the GNU general public license,
# Version 3.  See the file COPYING for more details

#!/bin/bash

declare -r FANCY_BEEP="fancy-beep"
declare -r sound_path="$HOME/.config/$FANCY_BEEP/sounds/complete.oga"
declare -r sound_app="paplay"

function fancy-beep ()
{
  . ./includes/usage.sh --source-only
  . ./includes/beep-control.sh --source-only
  (>&2 beep-control "$@" &)
}
