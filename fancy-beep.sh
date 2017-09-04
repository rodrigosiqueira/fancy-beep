#
# Copyright (C) 2017 Rodrigo Siqueira  <siqueira@ime.usp.br>
#
# This source code is licensed under the GNU general public license,
# Version 3.  See the file COPYING for more details
#!/bin/bash

# Set required variables
FANCY_BEEP=${FANCY_BEEP:-"fancy-beep"}
sound_path=${sound_path:-"$HOME/.config/$FANCY_BEEP/sounds/complete.oga"}
sound_app=${sound_app:-"paplay"}
main_fancy_beep_path=${main_fancy_beep_path:-"$HOME/.config/$FANCY_BEEP/src"}

# Export external variables required by fancy-beep
export FANCY_BEEP
export sound_path
export sound_app

# Main function responsible for call fancy beep
function fancy-beep ()
{
  (>&2 bash $main_fancy_beep_path/main-fancy-beep.sh "$@" &)
}
