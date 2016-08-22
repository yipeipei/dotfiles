info:
	@grep ^[a-z] Makefile | cut -d: -f1

setup-bash:
	./ln.sh "$(shell pwd)/bash/bash_profile.sh" "${HOME}/.bash_profile"
	./ln.sh "$(shell pwd)/bash/bashrc.sh" "${HOME}/.bashrc"

setup-ssh:
	./ln.sh "$(shell pwd)/ssh/keys" "${HOME}/.ssh"

setup-git:
	./ln.sh "$(shell pwd)/git/gitconfig" "${HOME}/.gitconfig"
	./ln.sh "$(shell pwd)/git/gitignore_global" "${HOME}/.gitignore_global"

setup-git-extra:
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

setup-autojump:
	git clone --depth 1 https://github.com/wting/autojump.git
	cd autojump && ./install.py
	rm -rf autojump

setup-fpp:
	rm -rf ~/.PathPicker
	git clone --depth 1 https://github.com/facebook/PathPicker.git ~/.PathPicker
	./ln.sh ~/.PathPicker/fpp /usr/local/bin/fpp

setup-prelude:
	git clone --depth 1 https://github.com/bbatsov/prelude.git ~/.emacs.d

setup-cygwin: setup-bash setup-ssh setup-git setup-git-extra setup-autojump setup-fpp
	./ln.sh "$(shell pwd)/cygwin/minttyrc.sh" "${HOME}/.minttyrc"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Dropbox" "${HOME}/Dropbox"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Google Drive" "${HOME}/Google Drive"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Music" "${HOME}/Music"
	./ln.sh "$(shell cygpath ${USERPROFILE})/wd" "${HOME}/wd"

setup-csr: setup-bash setup-git setup-git-extra
	./ln.sh "$(shell pwd)/csr/ssh" "${HOME}/.ssh"
	./ln.sh "$(shell pwd)/csr/Brewfile" "${HOME}/.Brewfile"

