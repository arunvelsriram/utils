#!/usr/bin/env bats

load test_helper

@test "curl" {
  run check_cmd "curl"
  [ "$status" -eq 0 ]
}

@test "httpie" {
  run check_cmd "http"
  [ "$status" -eq 0 ]
}

@test "dnsutils" {
	run check_cmd "dig"
	[ "$status" -eq 0 ]

	run check_cmd "nslookup"
	[ "$status" -eq 0 ]
}

@test "iputils-ping" {
	run check_cmd "ping"
	[ "$status" -eq 0 ]
}

@test "jq" {
	run check_cmd "jq"
	[ "$status" -eq 0 ]
}

@test "mongodb-clients" {
	run check_cmd "mongo"
	[ "$status" -eq 0 ]
}

@test "mysql-client" {
	run check_cmd "mysql"
	[ "$status" -eq 0 ]
}

@test "net-tools" {
	run check_cmd "netstat"
	[ "$status" -eq 0 ]

	run check_cmd "ifconfig"
	[ "$status" -eq 0 ]

	run check_cmd "route"
	[ "$status" -eq 0 ]
}

@test "postgresql-client" {
	run check_cmd "psql"
	[ "$status" -eq 0 ]
}

@test "redis-tools" {
	run check_cmd "redis-cli"
	[ "$status" -eq 0 ]
}

@test "telnet" {
	run check_cmd "telnet"
	[ "$status" -eq 0 ]
}

@test "vim" {
	run check_cmd "vim"
	[ "$status" -eq 0 ]
}

@test "influxdb-client" {
	run check_cmd "influx"
	[ "$status" -eq 0 ]
}

@test "rabbitmq-server" {
	run check_cmd "rabbitmqctl"
	[ "$status" -eq 0 ]
}

@test "rabbitmqadmin" {
	run check_cmd "rabbitmqadmin"
	[ "$status" -eq 0 ]
}
@test "swaks" {
	run check_cmd "swaks"
	[ "$status" -eq 0 ]
}
@test "netcat-openbsd" {
	run check_cmd "nc"
	[ "$status" -eq 0 ]
}
@test "wget" {
	run check_cmd "wget"
	[ "$status" -eq 0 ]
}
@test "bind9-host" {
	run check_cmd "host"
	[ "$status" -eq 0 ]
}

@test "pip" {
	run check_cmd "pip"
	[ "$status" -eq 0 ]
}

@test "cqlsh" {
	run check_cmd "cqlsh"
	[ "$status" -eq 0 ]
}
