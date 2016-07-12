# print the welcome banner
# fish_logo
fortune | fishthink | lolcat
# ponysay -q # print a pony w/ pony quote

# bell volume
xset b 80


#
# std prompt config
#
set __fish_prompt_color_carat (set_color -o blue)
set __fish_prompt_color_user (set_color -o blue)

#
# git prompt config
#
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)


# powerline colors, courtesy of @benniemosher
# https://github.com/benniemosher/dotfiles/blob/clean-fish-redo/config/fish/config.fish#L42
set -g theme_color_scheme user
set -l colorfg abb2c0
set -l dircolor 3E4451
set __color_initial_segment_exit     white red --bold
set __color_initial_segment_su       white green --bold
set __color_initial_segment_jobs     white blue --bold

set __color_path                     $dircolor white
set __color_path_basename            $dircolor white --bold
set __color_path_nowrite             magenta $colorfg
set __color_path_nowrite_basename    magenta $colorfg --bold

set __color_repo                     green white
set __color_repo_work_tree           green white --bold
set __color_repo_dirty               red white
set __color_repo_staged              yellow white

set __color_vi_mode_default          brblue $colorfg --bold
set __color_vi_mode_insert           brgreen $colorfg --bold
set __color_vi_mode_visual           bryellow $colorfg --bold

set __color_vagrant                  brcyan $colorfg
set __color_username                 white black
set __color_rvm                      brmagenta $colorfg --bold
set __color_virtualfish              brblue $colorfg --bold


# plugins
# fundle plugin 'tuvistavie/fish-ssh-agent'
fundle plugin 'oh-my-fish/theme-bobthefish'
fundle init
