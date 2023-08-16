#! /usr/bin/env fish

function with_fastgit
	HTTPS_PROXY=http://127.0.0.1:38457 $argv 
end
