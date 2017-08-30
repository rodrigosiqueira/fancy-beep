#
# Copyright (C) 2017 Rodrigo Siqueira  <siqueira@ime.usp.br>
#
# This source code is licensed under the GNU general public license,
# Version 3.  See the file COPYING for more details

function beep-control ()
{
  local -A parameters
  local -i totalShift=0
  local OPTIND

  . ./includes/usage.sh --source-only

  while getopts "t:r:i:h" option; do
    case $option in
      t | r | i)
        parameters[$option]=$OPTARG
        (( totalShift += 2 ))
        ;;
      h | * | \?)
        usage-fancy-beep
        return 1
        ;;
    esac
  done

  # Shift fancy-beeps parameters in case to eval
  for (( i = 0; i < $totalShift; i++ )); do
    shift
  done

  # If repetition is not defined, the default is 1
  if [ -z ${parameters["r"]} ]; then
    parameters["r"]=1
  fi
  # If interval is not defined, the default is 1
  if [ -z ${parameters["i"]} ]; then
    parameters["i"]=1
  fi
  # If time is null, default to 0
  if [ -z ${parameters["t"]} ]; then
    parameters["t"]=0
  fi

  if [ $# -ne 0 ]; then
    eval "$@"
    eval $sound_app $sound_path
    exit 0
  fi

  local interval_of_interactions=$(eval echo {1..${parameters["i"]}})
  local repetition_sequence=$(eval echo {1..${parameters["r"]}})
  for interaction in $interval_of_interactions; do
    for repetition in $repetition_sequence; do
      sleep ${parameters["t"]}
      eval $sound_app $sound_path
    done
  done
}
