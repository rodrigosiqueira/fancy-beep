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
  echo -e "\t-l\tShow log time"
}

function eval-command-and-sound ()
{
  eval "$@"
  eval $sound_app $sound_path
  exit 0
}

function add-to-logfile ()
{
  local timestamp=$(date +%s)
  echo "$timestamp" >> $log_path
  # get timestamp as a return
  echo "$timestamp"
}

function clean-up-logfile ()
{
  local timeStamp=$1
  eval "sed -i '/$timeStamp/d' $log_path"
}

function show-log-time ()
{
  local -i timestamp=$(date +%s)

  echo "Table of elapsed time:"
  while IFS='' read line || [[ -n "$line" ]]; do
    echo " $(( timestamp - line ))"
  done < "$log_path"
}

function beep-control ()
{
  local -A parameters
  local -i totalShift=0
  local OPTIND

  while getopts "t:r:i:lh" option; do
    case $option in
      t | r | i)
        parameters[$option]=$OPTARG
        (( totalShift += 2 ))
        ;;
      l)
        show-log-time
        return 0
        ;;
      h | * | \?)
        usage-fancy-beep
        return 0
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
    eval-command-and-sound "$@"
  fi

  # Create log file
  local timeStamp=$(add-to-logfile)

  local interval_of_interactions=$(eval echo {1..${parameters["i"]}})
  local repetition_sequence=$(eval echo {1..${parameters["r"]}})
  for interaction in $interval_of_interactions; do
    for repetition in $repetition_sequence; do
      sleep ${parameters["t"]}
      eval $sound_app $sound_path
      clean-up-logfile  $timeStamp
    done
  done
}
