clean:
	rm -f docs/*
build: clean
	./build.tcl
new: build
	./new.tcl
