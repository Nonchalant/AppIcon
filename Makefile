BINARY?=appicon
BUILD_FOLDER?=.build
PREFIX?=/usr/local
PROJECT?=AppIcon
RELEASE_BINARY_FOLDER?=$(BUILD_FOLDER?)/release/$(PROJECT?)

build:
	swift build -c release -Xswiftc -static-stdlib

test:
	swift test

clean:
	swift package clean
	rm -rf "$(BUILD_FOLDER)" "$(PROJECT).xcodeproj"

xcode:
	swift package generate-xcodeproj

install: build
	mkdir -p "$(PREFIX)/bin"
	cp -f "$(RELEASE_BINARY_FOLDER)" "$(PREFIX)/bin/$(BINARY)"
