setup-git:
	./ln.sh -s -f $(shell pwd)/git/.gitconfig ~/.gitconfig
	./ln.sh -s -f $(shell pwd)/git/.gitignore_global ~/.gitignore_global

setup-cygwin:
	./ln.sh -s -f $(shell pwd)/cygwin/.minttyrc ~/.minttyrc

setup-shell:
	# ./bash/install-bashrc.sh
	./ln.sh -s -f $(shell pwd)/bash/bashrc.sh ~/.bashrc
	./ln.sh -s -f $(shell pwd)/bash/bashrc.sh ~/.zshrc
