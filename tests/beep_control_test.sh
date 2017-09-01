. ./fancy-beep.sh --source-only
. $(dirname $0)/helper/test_helper.sh

setUp()
{
  sound_path_ORIG=$sound_path
  sound_app_ORIG=$sound_app
  main_fancy_beep_path_ORIG=$main_fancy_beep_path

  # Change variables for running test
  sound_path="sounds/complete.oga"
  sound_app="paplay"
  main_fancy_beep_path="src"
  export_variables
}

tearDown()
{
  sound_path=$sound_path_ORIG
  sound_app=$sound_app_ORIG
  main_fancy_beep_path=$main_fancy_beep_path_ORIG
  export_variables
}

function export_variables ()
{
  export FANCY_BEEP
  export sound_path
  export sound_app
}

test_beep_control_help ()
{
  fancy-beep -h
  assertEquals 'Help parameter not work' $? 0
}

test_beep_eval_command ()
{
  fancy-beep ls
  assertEquals 'fancy-beep should eval a command' $? 0
}

test_beep_wait ()
{
  fancy-beep -t 1
  assertEquals 'fancy-beep should beep after 1s' $? 0
}

load_shunit2
