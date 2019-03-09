function check_cmd() {
  docker run --rm arunvelsriram/utils bash -c "type $1"
}
