#!/usr/bin/env bats

load test_helper

@test "utils user" {
  run check_cmd "whoami"
  assert_success
  assert_output "utils"
}

@test "utils user home" {
  run check_cmd "pwd"
  assert_success
  assert_output "/home/utils"
}

@test "curl" {
  run check_cmd "curl --version"
  assert_success
}

@test "httpie" {
  run check_cmd "http --version"
  assert_success
}

@test "dnsutils" {
	run check_cmd "dig -v"
	assert_success

	run check_cmd "nslookup localhost"
	assert_success
}

@test "iputils-ping" {
	run check_cmd "ping -V"
	assert_success
}

@test "jq" {
	run check_cmd "jq --version"
	assert_success
}

@test "mongosh" {
	run check_cmd "mongosh --version"
	assert_success
}

@test "mysql-client" {
	run check_cmd "mysql --version"
	assert_success
}

@test "net-tools" {
	run check_cmd "netstat --version"
	assert_success

	run check_cmd "ifconfig --version"
	assert_success
}

@test "iproute2" {
	run check_cmd "ip -V"
	assert_success
}

@test "iptables" {
	run check_cmd "iptables -V"
	assert_success
}

@test "postgresql-client" {
	run check_cmd "psql --version"
	assert_success
}

@test "redis-tools" {
	run check_cmd "redis-cli --version"
	assert_success
}

@test "telnet" {
	run check_cmd "telnet"
	assert_success
}

@test "vim" {
	run check_cmd "vim --version"
	assert_success
}

@test "influxdb-client" {
	run check_cmd "influx --version"
	assert_success
}

@test "rabbitmq-server" {
	run check_cmd "rabbitmqctl help"
	assert_success
}

@test "rabbitmqadmin" {
	run check_cmd "rabbitmqadmin --version"
	assert_success
}
@test "swaks" {
	run check_cmd "swaks --version"
	assert_success
}
@test "netcat-openbsd" {
	run check_cmd "nc -h"
	assert_success
}
@test "wget" {
	run check_cmd "wget --version"
	assert_success
}
@test "bind9-host" {
	run check_cmd "host -V"
	assert_success
}

@test "pip" {
	run check_cmd "pip3 -V"
	assert_success
}

@test "cqlsh" {
	run check_cmd "cqlsh --version"
	assert_success
}

@test "ssh" {
	run check_cmd "ssh -V"
	assert_success
}

@test "oha" {
	run check_cmd "oha --version"
	assert_success
}

@test "archive and compression" {
	run check_cmd "7z --help"
	assert_success

	run check_cmd "tar --version"
	assert_success

	run check_cmd "xz --version"
	assert_success
}

@test "gnupg" {
  run check_cmd "gpg --version"
  assert_success
}

@test "kafkacat" {
  run check_cmd "kcat -V"
  assert_success
}

@test "kaf" {
  run check_cmd "kaf help"
  assert_success
}

@test "tcpdump" {
  run check_cmd "tcpdump --version"
  assert_success
}

@test "ngrep" {
  run check_cmd "ngrep -V"
  assert_success
}

@test "nmap" {
  run check_cmd "nmap --version"
  assert_success
}
@test "sngrep" {
  run check_cmd "sngrep --version"
  assert_success
}
