setup-bash:
	./ln.sh "$(shell pwd)/bash/bashrc.sh" "${HOME}/.bashrc"

setup-ssh:
	./ln.sh "$(shell pwd)/ssh/keys" "${HOME}/.ssh"

setup-git:
	./ln.sh "$(shell pwd)/git/gitconfig" "${HOME}/.gitconfig"
	./ln.sh "$(shell pwd)/git/gitignore_global" "${HOME}/.gitignore_global"

setup-autojump:
	git clone git://github.com/joelthelion/autojump.git
	cd autojump && ./install.py
	rm -rf autojump

setup-cygwin: setup-bash setup-ssh setup-git setup-autojump
	./ln.sh "$(shell pwd)/cygwin/minttyrc.sh" "${HOME}/.minttyrc"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Dropbox" "${HOME}/Dropbox"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Google Drive" "${HOME}/Google Drive"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Music" "${HOME}/Music"
