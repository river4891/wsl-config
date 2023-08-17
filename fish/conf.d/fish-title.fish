#! /usr/bin/env fish

# reference: https://fishshell.com/docs/current/cmds/fish_title.html

function fish_title
	echo (whoami)@(hostname)
end
