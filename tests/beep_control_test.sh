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

  # Set a path structure for test fancy-beep with ls
  target_output='tests/temp_files'
  mkdir -p $target_output
  touch $target_output/test1.txt
  touch $target_output/test2.txt
}

tearDown()
{
  sound_path=$sound_path_ORIG
  sound_app=$sound_app_ORIG
  main_fancy_beep_path=$main_fancy_beep_path_ORIG
  export_variables
  # Clean up directory for ls test
  rm -rf $target_output
  unset target_output
}

function export_variables ()
{
  export FANCY_BEEP
  export sound_path
  export sound_app
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
