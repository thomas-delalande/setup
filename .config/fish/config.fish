if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose "ayu Dark"
    fish_config prompt choose disco
end

function brew-install
	echo "brew install" $argv >> $HOME/setup/1-install/1-3-install-brew-formulae.sh
	brew install $argv
end

funcsave brew-install
tmux
