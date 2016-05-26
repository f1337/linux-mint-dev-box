function fish_prompt
	printf '%s%s%s \a%s%s%s' "$__fish_prompt_color_user" (whoami) (set_color normal) \
		(set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
	__fish_git_prompt ' (%s)'
	printf ' %s$%s ' "$__fish_prompt_color_carat" (set_color normal)
end
