help:  # list all targets
	@grep ^[a-z] Makefile

####### END-OF-TEMPLATE

update-gitignore-global:  # update .gitignore-global from https://www.gitignore.io
	curl -L -s https://www.gitignore.io/api/osx,linux,windows,visualstudiocode,emacs,vim,jetbrains,xcode > .gitignore-global
