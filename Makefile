setup-git:
	./ln.sh -s -f $(shell pwd)/git/.gitconfig ~/.gitconfig
	./ln.sh -s -f $(shell pwd)/git/.gitignore_global ~/.gitignore_global

setup-cygwin:
	./ln.sh -s -f $(shell pwd)/cygwin/.minttyrc ~/.minttyrc

setup-bash:
	./ln.sh -s -f $(shell pwd)/bash/bashrc.sh ~/.bashrc

setup-ssh:
	./ln.sh -s -f $(shell pwd)/ssh/keys ~/.ssh

setup-autojump:
	git clone git://github.com/joelthelion/autojump.git
	cd autojump && ./install.py
	rm -rf autojump
