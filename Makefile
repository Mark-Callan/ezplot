.PHONY: install config files

install: files ezplot

files:
	mkdir -p $(HOME)/.local/
	cp -R ./files/* $(HOME)/.local

ezplot: $(HOME)/.local/bin/ezplot
$(HOME)/.local/bin/ezplot:
	mkdir -p $(HOME)/.local/bin
	ln -s $(HOME)/.local/opt/chia/bin/ezplot ~/.local/bin/ezplot

config:
	mkdir -p ~/.local/opt/chia/config
	cp $(shell find ./config -type f) ~/.local/opt/chia/config/
