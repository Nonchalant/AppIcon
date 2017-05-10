TEMPORARY_FOLDER?=.build/release
PREFIX?=/usr/local

build:
	swift build -c release -Xswiftc -static-stdlib

test:
	swift test

clean:
	swift package clean

xcode:
	swift package generate-xcodeproj

install: build
	mkdir -p "$(PREFIX)/bin"
	cp -f "$(TEMPORARY_FOLDER)/AppIcon" "$(PREFIX)/bin/appicon"
