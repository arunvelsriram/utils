#!/usr/bin/env bats

load test_helper

@test "utils user" {
  run check_cmd "whoami"
  [ "$status" -eq 0 ]
  [ $(echo "$output" | grep -v WARNING) = "utils" ]
}

@test "utils user home" {
  run check_cmd "pwd"
  [ "$status" -eq 0 ]
  [ $(echo "$output" | grep -v WARNING) = "/home/utils" ]
}

@test "curl" {
  run check_cmd "curl --version"
  [ "$status" -eq 0 ]
}

@test "httpie" {
  run check_cmd "http --version"
  [ "$status" -eq 0 ]
}

@test "dnsutils" {
	run check_cmd "dig -v"
	[ "$status" -eq 0 ]

	run check_cmd "nslookup localhost"
	[ "$status" -eq 0 ]
}

@test "iputils-ping" {
	run check_cmd "ping -V"
	[ "$status" -eq 0 ]
}

@test "jq" {
	run check_cmd "jq --version"
	[ "$status" -eq 0 ]
}

@test "mongosh" {
	run check_cmd "mongosh --version"
	[ "$status" -eq 0 ]
}

@test "mysql-client" {
	run check_cmd "mysql --version"
	[ "$status" -eq 0 ]
}

@test "net-tools" {
	run check_cmd "netstat --version"
	[ "$status" -eq 0 ]

	run check_cmd "ifconfig --version"
	[ "$status" -eq 0 ]

	run check_cmd "route --version"
	[ "$status" -eq 0 ]
}

@test "postgresql-client" {
	run check_cmd "psql --version"
	[ "$status" -eq 0 ]
}

@test "redis-tools" {
	run check_cmd "redis-cli --version"
	[ "$status" -eq 0 ]
}

@test "telnet" {
	run check_cmd "telnet"
	[ "$status" -eq 0 ]
}

@test "vim" {
	run check_cmd "vim --version"
	[ "$status" -eq 0 ]
}

@test "influxdb-client" {
	run check_cmd "influx --version"
	[ "$status" -eq 0 ]
}

@test "rabbitmq-server" {
	run check_cmd "rabbitmqctl help"
	[ "$status" -eq 0 ]
}

@test "rabbitmqadmin" {
	run check_cmd "rabbitmqadmin --version"
	[ "$status" -eq 0 ]
}
@test "swaks" {
	run check_cmd "swaks --version"
	[ "$status" -eq 0 ]
}
@test "netcat-openbsd" {
	run check_cmd "nc -h"
	[ "$status" -eq 0 ]
}
@test "wget" {
	run check_cmd "wget --version"
	[ "$status" -eq 0 ]
}
@test "bind9-host" {
	run check_cmd "host -V"
	[ "$status" -eq 0 ]
}

@test "pip" {
	run check_cmd "pip3 -V"
	[ "$status" -eq 0 ]
}

@test "cqlsh" {
	run check_cmd "cqlsh --version"
	[ "$status" -eq 0 ]
}

@test "ssh" {
	run check_cmd "ssh -V"
	[ "$status" -eq 0 ]
}

@test "hey" {
	run check_cmd "hey --help"
	[ "$status" -eq 0 ]
}

@test "archive and compression" {
	run check_cmd "7z --help"
	[ "$status" -eq 0 ]

	run check_cmd "tar --version"
	[ "$status" -eq 0 ]

	run check_cmd "xz --version"
	[ "$status" -eq 0 ]
}

@test "gnupg" {
  run check_cmd "gpg --version"
  [ "$status" -eq 0 ]
}

@test "kafkacat" {
  run check_cmd "kcat -V"
  [ "$status" -eq 0 ]
}

@test "kaf" {
  run check_cmd "kaf help"
  [ "$status" -eq 0 ]
}

@test "tcpdump" {
  run check_cmd "tcpdump --version"
  [ "$status" -eq 0 ]
}

@test "ngrep" {
  run check_cmd "ngrep -V"
  [ "$status" -eq 0 ]
}

@test "nmap" {
  run check_cmd "nmap --version"
  [ "$status" -eq 0 ]
}
@test "sngrep" {
  run check_cmd "sngrep --version"
  [ "$status" -eq 0 ]
}
