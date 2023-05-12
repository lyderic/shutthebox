_listing:
	@printf "${BLU}{{justfile()}}${NOC}\n"
	@just --unsorted --list --list-heading='' --list-prefix=' • ' \
		| grep -v 'alias for'

@play:
	go install
	shutthebox

x-compile:
	#!/bin/bash
	[ -d binaries ] || mkdir -pv binaries
	while read -r line ; do
		GOOS=$(echo "${line}" | awk '{print $1}')
		GOARCH=$(echo "${line}" | awk '{print $2}')
		output="{{name}}-${GOOS}-${GOARCH}-{{version}}"
		go build -o "binaries/${output}" && {
			echo "Successfully compiled ${output}"
		} || {
			echo "${output}: compilation failed!"
		}
	done < osarch-combinations.txt

name := "shutthebox"
version := `grep VERSION globals.go | awk -F'"' '{print $2}'`
set shell := ["bash","-uc"]
# vim: ft=make
