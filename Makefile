setup-git:
	ln -s -f $(shell pwd)/git/.gitconfig ~/.gitconfig
	ln -s -f $(shell pwd)/git/.gitignore_global ~/.gitignore_global

setup-cygwin:
	ln -s -f $(shell pwd)/cygwin/.minttyrc ~/.minttyrc

setup-bash:
	./bash/install-bashrc.sh
