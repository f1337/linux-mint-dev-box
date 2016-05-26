function fish_prompt
	#set last_status $status
	printf '%s \a%s%s%s' (whoami) \
		(set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
	__fish_git_prompt ' (%s)'
	printf ' $ '
end
