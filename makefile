

setup:
	ln -s ./dot-emacs $(HOME)/.emacs
	ln -s ./ $(HOME)/.emacs.d

submodules:
	git submodule update --init ./slime
