.PHONY: install config

install:
	mkdir -p $(HOME)/.local/
	cp -R ./files/* $(HOME)/.local
	mkdir -p $(HOME)/.local/bin
	ln -s $(HOME)/.local/opt/chia/bin/ezplot ~/.local/bin/ezplot

config:
	mkdir -p ~/.local/opt/chia/config
	cp $(shell find ./config -type f) ~/.local/opt/chia/config/
