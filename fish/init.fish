#! /usr/bin/env fish

set myfilename (status filename)
set local_dir  (dirname $myfilename)
set real_dir (cd $local_dir ; pwd)

for item in $real_dir/conf.d/*
	source $item
end
	
