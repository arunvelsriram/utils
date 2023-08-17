function check_cmd() {
  UTILS_TEST_IMAGE=${UTILS_TEST_IMAGE:=utils-test}
  docker run --rm ${UTILS_TEST_IMAGE} bash -c "$@"
}
