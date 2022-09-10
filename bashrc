# set vim keybindings in command line
set -o vi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ll="ls -l"
alias la="ls -la"
alias python="python3"
alias rm="rm -i"

# Command prompt
parse_git_branch () {
	# function to get git branch from current directory
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# colors are defined in "\e[x;ym <colored_content> \e[m" where x;y is the color pair (x=0/1(dark/light), y=color)
# export PS1="\u@\h \e[0;36m\w\e[m\e[0;35m\$(parse_git_branch)\e[m $ "
LIGHT_BLUE="36"
MAGENTA="35"
# prompt below will result in "<username>@<hostname> <current_directory> (<git_branch>) $"
export PS1="\[\033[0;${LIGHT_BLUE}m\]\u@\h \w\[\033[0;${MAGENTA}m\]\$(parse_git_branch) \[\033[0;m\]$ "