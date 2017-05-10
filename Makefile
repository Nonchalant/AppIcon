build:
	swift build -c release -Xswiftc -static-stdlib

test:
	swift test

clean:
	swift package clean

xcode:
	swift package generate-xcodeproj

install: build
	cp -f .build/release/AppIcon /usr/local/bin/appicon
