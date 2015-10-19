

setup:
	ln -s `pwd`/dot-emacs $(HOME)/.emacs
	ln -s `pwd`/ $(HOME)/.emacs.d

submodules:
	git submodule update --init ./slime
