SHELL=/bin/bash

FILE_NAME:=$(shell [[ $$(git config --local --get "remote.origin.url") =~ /([^.]+)(\.git)?$$ ]]; echo "$${BASH_REMATCH[1]}")

release: releases
	make clean
	rsync -av $(FILE_NAME) README.md LICENSE releases/$(FILE_NAME)
	( cd releases; zip -r $(FILE_NAME)_noarch.zip $(FILE_NAME); )
	for os in linux darwin; do \
		for arch in 386 amd64; do \
			ln releases/$(FILE_NAME)_noarch.zip releases/$(FILE_NAME)_$${os}_$${arch}.zip; \
		done \
	done

releases:
	mkdir -p releases/$(FILE_NAME)

clean:
	rm -rf releases/* 2>/dev/null || :
