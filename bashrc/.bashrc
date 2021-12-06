#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#shortcuts
alias o='xdg-open'
alias pingg='ping 8.8.8.8'
alias q='exit'
alias kw='date +%U'
#Programs
alias vim='nvim'
alias pan='pandoc -s -c ~/.pandoc.css --mathjax'
alias rm='rm -i'
alias sudo='sudo '
alias ls='ls --color=auto'
alias zathura='zathura --fork'
#Bookmarks
alias bk='cd $(fzf < ~/.scripts/bookmarks.lst)&&ls'
alias addbk='~/.scripts/bookmark.sh'
alias delbk='~/.scripts/delbookmark.sh'
#fzf
alias img='imv $(ls *.jpg *.JPG *.png *.PNG 2> /dev/null| fzf)'
alias pdf='find *.pdf | fzf |xargs -i zathura --fork "{}"'
alias fd='cd $(find -type d | fzf)&&ls'
#clipboard
alias c='xclip -selection clipboard'
alias v='xclip -selection clipboard -o'

#additional folders in path
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/bin

#PS1 stuff

cyan=$(tput setaf 1)
yellow=$(tput setaf 3)
magenta=$(tput setaf 6)
reset=$(tput sgr0)

gitView(){
	# 's/\(.*\)/ (\1)/'
	# s/1/2/	substitute 1 with 2
	# \(.....\)	defines reference, can be referenced to with \1
	git branch 2> /dev/null | grep "*" | sed s/*/''/g | sed s/' '/''/g | sed -e 's/\(.*\)/ (\1)/'
}

jobsCount(){
    count=`jobs`
    if [ -z "$count" ]
    then
        echo ""
    else
        out=$(jobs | wc -l)
        echo "[$out]"
    fi
}

PS1='\[$yellow\]$(jobsCount)\[$reset\][\[$cyan\]\u\[$reset\]:\[$magenta\]\w\[$reset\]\[$yellow\]$(gitView)\[$reset\]]\$ '

#N E O F E T C H
neofetch

