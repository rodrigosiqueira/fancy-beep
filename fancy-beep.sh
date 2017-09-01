#
# Copyright (C) 2017 Rodrigo Siqueira  <siqueira@ime.usp.br>
#
# This source code is licensed under the GNU general public license,
# Version 3.  See the file COPYING for more details

#!/bin/bash

FANCY_BEEP="fancy-beep"
sound_path="$HOME/.config/$FANCY_BEEP/sounds/complete.oga"
sound_app="paplay"

main_fancy_beep_path="$HOME/.config/$FANCY_BEEP/src"

export FANCY_BEEP
export sound_path
export sound_app

function fancy-beep ()
{
  (>&2 bash $main_fancy_beep_path/main-fancy-beep.sh "$@" &)
}
