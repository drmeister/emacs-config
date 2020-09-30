
all:
	git clone https://github.com/slime/slime.git
	make setup

setup:
	ln -s `pwd`/dot-emacs $(HOME)/.emacs

