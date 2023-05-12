_listing:
	@printf "${BLU}{{justfile()}}${NOC}\n"
	@just --unsorted --list --list-heading='' --list-prefix=' • ' \
		| grep -v 'alias for'

@play:
	go install
	shutthebox

watch:
	@watchexec -e go -c -- just play

watch-readme:
	@watchexec -e md -c -- glow README.md

x-compile:
	[ -d binaries ] || mkdir -pv binaries
	GOOS=darwin	  GOARCH=amd64 go build -o binaries/{{name}}-darwin-amd64-{{version}}
	GOOS=darwin	  GOARCH=arm64 go build -o binaries/{{name}}-darwin-arm64-{{version}}
	GOOS=freebsd	GOARCH=386   go build -o binaries/{{name}}-freebsd-386-{{version}}
	GOOS=freebsd	GOARCH=amd64 go build -o binaries/{{name}}-freebsd-amd64-{{version}}
	GOOS=freebsd	GOARCH=arm   go build -o binaries/{{name}}-freebsd-arm-{{version}}
	GOOS=linux	  GOARCH=386   go build -o binaries/{{name}}-linux-386-{{version}}
	GOOS=linux	  GOARCH=amd64 go build -o binaries/{{name}}-linux-amd64-{{version}}
	GOOS=linux	  GOARCH=arm   go build -o binaries/{{name}}-linux-arm-{{version}}
	GOOS=linux	  GOARCH=arm64 go build -o binaries/{{name}}-linux-arm64-{{version}}
	GOOS=netbsd	  GOARCH=386   go build -o binaries/{{name}}-netbsd-386-{{version}}
	GOOS=netbsd	  GOARCH=amd64 go build -o binaries/{{name}}-netbsd-amd64-{{version}}
	GOOS=netbsd	  GOARCH=arm   go build -o binaries/{{name}}-netbsd-arm-{{version}}
	GOOS=openbsd	GOARCH=386   go build -o binaries/{{name}}-openbsd-386-{{version}}
	GOOS=openbsd	GOARCH=amd64 go build -o binaries/{{name}}-openbsd-amd64-{{version}}
	GOOS=openbsd	GOARCH=arm   go build -o binaries/{{name}}-openbsd-arm-{{version}}
	GOOS=openbsd	GOARCH=arm64 go build -o binaries/{{name}}-openbsd-arm64-{{version}}
	GOOS=solaris	GOARCH=amd64 go build -o binaries/{{name}}-solaris-amd64-{{version}}
	GOOS=windows	GOARCH=386   go build -o binaries/{{name}}-windows-386-{{version}}
	GOOS=windows	GOARCH=amd64 go build -o binaries/{{name}}-windows-amd64-{{version}}
	GOOS=windows	GOARCH=arm   go build -o binaries/{{name}}-windows-arm-{{version}}
	GOOS=windows	GOARCH=arm64 go build -o binaries/{{name}}-windows-arm64-{{version}}

name := "shutthebox"
version := `grep VERSION globals.go | awk -F'"' '{print $2}'`
set shell := ["bash","-uc"]
# vim: ft=make
