.PHONY: install config files

install: files ezplot

files:
	mkdir -p $(HOME)/.local/
	cp -R ./files/* $(HOME)/.local
	chmod +x ~/.local/opt/chia/bin/*

ezplot: $(HOME)/.local/bin/ezplot
$(HOME)/.local/bin/ezplot:
	mkdir -p $(HOME)/.local/bin
	ln -s $(HOME)/.local/opt/chia/bin/ezplot ~/.local/bin/ezplot

config:
	mkdir -p ~/.local/opt/chia/config
	cp $(shell find ./config -type f) ~/.local/opt/chia/config/

service:
	sudo cp ./files/usr/lib/systemd/user/ezplot.service /usr/lib/systemd/user/ezplot.service
	sudo sysctl daemon-reload
	sudo systemctl enable ezplot.service
	sudo systemctl start ezplot.service
