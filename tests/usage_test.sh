. ./src/main-fancy-beep.sh --source-only
. $(dirname $0)/helper/test_helper.sh

declare -r target_output='tests/temp_files'

test_usage_helper ()
{
  local first_line=$(usage-fancy-beep | head -1)
  assertEquals 'Usage: fancy-beep [-OPTION] [COMMAND [ARGS]]' "$first_line"
}

load_shunit2
