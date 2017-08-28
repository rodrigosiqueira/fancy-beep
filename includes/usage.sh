#
# Copyright (C) 2017 Rodrigo Siqueira  <siqueira@ime.usp.br>
#
# This source code is licensed under the GNU general public license,
# Version 3.  See the file COPYING for more details

function usage-fancy-beep()
{
  echo "Usage: fancy-beep [-OPTION] [COMMAND [ARGS]]"
  echo "   or: fancy-beep [-OPTION]"
  echo -e "\t-t\tSpecify time to wait (Seconds)"
  echo -e "\t-r\tTotal of sound repetitions"
  echo -e "\t-i\tTotal of intervals"
  return 0
}
