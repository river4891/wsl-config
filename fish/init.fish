#! /usr/bin/env fish

begin
	set -l myfilename (status filename)
	set -l local_dir  (dirname $myfilename)
	set -l real_dir (cd $local_dir ; echo $PWD)

	for item in $real_dir/conf.d/*
		source $item
	end
	cd $HOME
end

