info:
	@grep ^[a-z] Makefile | cut -d: -f1

setup-bash:
	./ln.sh "$(shell pwd)/bash/bash_profile.sh" "${HOME}/.bash_profile"
	./ln.sh "$(shell pwd)/bash/bashrc.sh" "${HOME}/.bashrc"
	./ln.sh "$(shell pwd)/bash/inputrc.sh" "${HOME}/.inputrc"
	./ln.sh "$(shell pwd)/bash/profile.sh" "${HOME}/.profile"
	./ln.sh "$(shell pwd)/bash/screenrc.sh" "${HOME}/.screenrc"

setup-ssh:
	./ln.sh "$(shell pwd)/ssh/config" "${HOME}/.ssh/config"

setup-git:
	./ln.sh "$(shell pwd)/git/gitconfig" "${HOME}/.gitconfig"
	./ln.sh "$(shell pwd)/git/.gitignore-global" "${HOME}/.gitignore-global"

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
	rm -rf ~/.emacs.d
	git clone --depth 1 https://github.com/bbatsov/prelude.git ~/.emacs.d

setup-spacemacs:
	rm -rf ~/.emacs.d
	git clone --depth 1 https://github.com/syl20bnr/spacemacs.git ~/.emacs.d

setup-aria2:
	./ln.sh "$(shell pwd)/aria2" "${HOME}/.aria2"

setup-cygwin: setup-bash setup-ssh setup-git setup-git-extra setup-autojump setup-fpp
	./ln.sh "$(shell pwd)/cygwin/minttyrc.sh" "${HOME}/.minttyrc"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Desktop" "${HOME}/Desktop"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Downloads" "${HOME}/Downloads"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Dropbox" "${HOME}/Dropbox"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Google Drive" "${HOME}/Google Drive"
	./ln.sh "$(shell cygpath ${USERPROFILE})/Music" "${HOME}/Music"
	./ln.sh "$(shell cygpath ${USERPROFILE})/wd" "${HOME}/wd"

setup-csr: setup-bash setup-git setup-git-extra
	./ln.sh "$(shell pwd)/csr/ssh/config" "${HOME}/.ssh/config"
	./ln.sh "$(shell pwd)/csr/Brewfile" "${HOME}/.Brewfile"
	./ln.sh "$(shell pwd)/csr/crontab-daily.sh" "${HOME}/.crontab-daily"

setup-osx: setup-bash setup-ssh setup-git setup-git-extra
