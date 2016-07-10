setup-bash:
	./ln.sh -s -f $(shell pwd)/bash/bashrc.sh ~/.bashrc

setup-ssh:
	./ln.sh -s -f -T $(shell pwd)/ssh/keys ~/.ssh

setup-git:
	./ln.sh -s -f $(shell pwd)/git/gitconfig ~/.gitconfig
	./ln.sh -s -f $(shell pwd)/git/gitignore_global ~/.gitignore_global

setup-autojump:
	git clone git://github.com/joelthelion/autojump.git
	cd autojump && ./install.py
	rm -rf autojump

setup-cygwin: setup-bash setup-ssh setup-git setup-autojump
	./ln.sh -s -f $(shell pwd)/cygwin/minttyrc.sh ~/.minttyrc
