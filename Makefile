
default: build-dir all-scripts

build-dir:
	mkdir -p build

all-scripts: build/work.applescript build/break.applescript

build/work.applescript: work-stub.applescript library.applescript
	cat work-stub.applescript library.applescript > build/work.applescript

build/break.applescript: break-stub.applescript library.applescript
	cat break-stub.applescript library.applescript > build/break.applescript
