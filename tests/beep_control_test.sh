. ./fancy-beep.sh --source-only
. $(dirname $0)/helper/test_helper.sh

test_beep_control_help ()
{
  local first_line=$(beepcontrol -h | head -1)
  assertEquals 'Help parameter not work' $? 0
}

test_beep_eval_command ()
{
  local first_line=$(beepcontrol ls | head -1)
  assertEquals 'fancy-beep should eval a command' $? 0
}

test_beep_wait ()
{
  beepcontrol -t 1
  assertEquals 'fancy-beep should beep after 1s' $? 0
}

load_shunit2
