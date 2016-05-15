setup-git:
	./git/git-config.sh

setup-cygwin:
	ln -s -f $(shell pwd)/cygwin/.minttyrc ~/.minttyrc

setup-bash:
	./bash/install-bashrc.sh
