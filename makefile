
all:
	git clone https://github.com/slime/slime.git
	make setup

setup:
	ln -Fs `pwd`/dot-emacs $(HOME)/.emacs

