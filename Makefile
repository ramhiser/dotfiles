PWD=$(shell pwd)
setup: # TODO: Skip .git/
	for dot_file in .[^.]*; do \
		ln -s $(PWD)/$$dot_file ~/$$dot_file ; \
	done
