ALL=dotfiles gnome go hub stow

.PHONY: all $(ALL)

all: $(ALL)

%.apt:
# $* is the stem of the match. E.g., for curl.apt, $* == curl.
	sudo apt-get install -y $*

gnome:
# $@ is the entire match.
	./$@.sh

go: curl.apt
	./$@.sh

hub: go git.apt
	./$@.sh

stow:
	./$@.sh
