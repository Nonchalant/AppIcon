TEMPORARY_FOLDER?=.build/release
PREFIX?=/usr/local
PROJECT?=AppIcon
BINARY?=appicon

build:
	swift build -c release -Xswiftc -static-stdlib

test:
	swift test

clean:
	swift package clean
	rm -rf ".build" "$(PROJECT).xcodeproj"

xcode:
	swift package generate-xcodeproj

install: build
	mkdir -p "$(PREFIX)/bin"
	cp -f "$(TEMPORARY_FOLDER)/$(PROJECT)" "$(PREFIX)/bin/$(BINARY)"

binary: build
	cp "$(TEMPORARY_FOLDER)/$(PROJECT)" "./$(BINARY)"
	zip "./$(BINARY).zip" "./$(BINARY)"
	rm "./$(BINARY)"
