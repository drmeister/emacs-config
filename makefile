

setup:
	ln -s ./dot-emacs $(HOME)/.emacs
	ln -s ./ $(HOME)/.emacs.d

submodules:
	git submodules update
