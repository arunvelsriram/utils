function check_cmd() {
  docker run --rm utils-test bash -c "$@"
}
