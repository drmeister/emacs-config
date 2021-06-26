
all:
	make setup
	rm -rf ./slime
	git clone https://github.com/slime/slime.git

setup:
	ln -Fs `pwd`/dot-emacs $(HOME)/.emacs

