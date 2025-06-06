type brew &>/dev/null && export BATS_LIB_PATH="${BATS_LIB_PATH}:$(brew --prefix)/lib"

bats_load_library bats-support
bats_load_library bats-assert

function check_cmd() {
  UTILS_TEST_IMAGE=${UTILS_TEST_IMAGE:=utils-test}
  docker run --rm ${UTILS_TEST_IMAGE} sh -c "$@"
}
