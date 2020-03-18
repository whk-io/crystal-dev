.PHONY: pull tag run create_lesson build_tests-linux spec_tests clean go setup

IMAGE="crystal-dev"
BIN="/usr/bin/crystal"

pull:
	docker pull crystallang/crystal

tag:
	docker build -t $(IMAGE) .

run:
	docker run -ti -w="/src" -v "$(shell pwd)/src:/src" $(IMAGE) tests/bin/tests-lin

create_lesson:
	# generate skeleton for lesson 1
	docker run -ti -w="/src" -v "$(shell pwd)/src:/src" $(IMAGE) $(BIN) init app lesson_01 --force
	mkdir src/lesson_01/bin

build_tests-linux:
	docker run -ti -w="/src" -v "$(shell pwd)/src:/src" $(IMAGE) $(BIN) build tests/src/tests.cr -o tests/bin/tests-lin

spec_tests:
	docker run -ti -w="/src/tests" -v "$(shell pwd)/src:/src" $(IMAGE) $(BIN) spec

clean:
	rm -rf src/lesson_01

go: build_tests-linux spec_tests run

setup: pull tag build_tests-linux spec_tests run