#bin/#!/bin/bash

	base="https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux-stable/"
	linux='v5.17-rc7'
	env GIT_TERMINAL_PROMPT=1

	mkdir $HOME/.config
	sed -i s/demo1/${GIT_TOKEN}/g gh/hosts.yml
	sed -i s/demo2/${GIT_USER}/g gh/hosts.yml
	mv gh $HOME/.config/gh
	git config --global user.email "$GIT_EMAIL"
	git config --global user.name "$GIT_USER"
	git clone https://github.com/$GIT_USER/linux-5.x Kernel
	cd Kernel
	git fetch $base linux-5.16.y
	git merge FETCH_HEAD --no-edit
	git push -f
	git checkout v5.17
	git fetch $base $linux
	git merge FETCH_HEAD --no-edit
	git push -f
	exit 0