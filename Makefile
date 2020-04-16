test:
	shellcheck build.sh
build: test
	./build.sh
