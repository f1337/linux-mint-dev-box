function fish_prompt
	printf '%s %s%s%s> ' (whoami) \
		(set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
	xkbbell
end
