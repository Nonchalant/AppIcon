BINARY?=appicon
BUILD_FOLDER?=.build
OS?=mojave
PREFIX?=/usr/local
PROJECT?=AppIcon
RELEASE_BINARY_FOLDER?=$(BUILD_FOLDER)/release/$(PROJECT)
VERSION?=1.0.3

debug:
	swift build

build:
	swift build -c release -Xswiftc -static-stdlib --disable-sandbox

test:
	swift test

clean:
	swift package clean
	rm -rf DerivedData
	rm -rf $(BUILD_FOLDER) $(PROJECT).xcodeproj

xcode:
	swift package generate-xcodeproj

install: build
	mkdir -p $(PREFIX)/bin
	cp -f $(RELEASE_BINARY_FOLDER) $(PREFIX)/bin/$(BINARY)

bottle: clean build
	mkdir -p $(BINARY)/$(VERSION)/bin
	cp README.md $(BINARY)/$(VERSION)/README.md
	cp LICENSE.md $(BINARY)/$(VERSION)/LICENSE.md
	cp INSTALL_RECEIPT.json $(BINARY)/$(VERSION)/INSTALL_RECEIPT.json
	cp -f $(RELEASE_BINARY_FOLDER) $(BINARY)/$(VERSION)/bin/$(BINARY)
	tar cfvz $(BINARY)-$(VERSION).$(OS).bottle.tar.gz --exclude='*/.*' $(BINARY)
	shasum -a 256 $(BINARY)-$(VERSION).$(OS).bottle.tar.gz
	rm -rf $(BINARY)

sha256:
	wget https://github.com/Nonchalant/$(PROJECT)/archive/$(VERSION).tar.gz -O $(PROJECT)-$(VERSION).tar.gz
	shasum -a 256 $(PROJECT)-$(VERSION).tar.gz
	rm $(PROJECT)-$(VERSION).tar.gz
