# ___  ______  
# \  \/ / ___\ 
#  \   / /_/ | vlad B.
#   \_/\___  / https://github.com/vladigr1/
#     /_____/  
#
# very simple bashrc for some one who want to use on windows

# History control
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=2000000
shopt -s histappend

#allias:
#path to myScripts
export PATH="/c/Users/vladi/source/myScripts:/c/Program Files/SumatraPDF:$PATH"
#general alias
alias egrep='egrep --color=auto'
#vim='vim \v'
alias gf="cd ~/source/"
alias gd="cd '/c/Users/vladi/Google Drive'"
alias :q="exit"
alias egrep='egrep --color=auto'

#git allias:
#alias glg="git log --all --graph --decorate --oneline"
git config --global alias.upw "update-git-for-windows"
git config --global alias.gr "grep -ni"
#git config lg glg but prettier
git config --global alias.lg "log --oneline --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

#function: 
# Open all modified files in vim tabs
function vimod {
	vim -p $(git status -suall | awk '{print $2}')
}

#my man file version using firfox location
#e.g:
#man grep
function man { 
	cd "/c/Program Files/Mozilla Firefox"
	./firefox https://man.cx/$1&
	cd - >/dev/null
}
# Change up a variable number of directories
# E.g:
#   cu   -> cd ../
#   cu 2 -> cd ../../
#   cu 3 -> cd ../../../
function cu {
	local count=$1
	if [ -z "${count}" ]; then
		count=1
	fi
	local path=""
    for i in $(seq 1 ${count}); do
        path="${path}../"
    done
    cd $path
}

#Prompt: Don`t touch
# 'Safe' version of __git_ps1 to avoid errors on systems that don't have it
function gitPrompt {
	command -v __git_ps1 > /dev/null && __git_ps1 " (%s)"
}

# Colours have names too. Stolen from Arch wiki REGULAR
txtgrn='\[\e[0;32m\]' # Green
txtpur='\[\e[0;35m\]' # Purple
txtwht='\[\e[0;37m\]' # White

# Prompt colours
atC="${txtpur}"
nameC="${txtpur}"
hostC="${txtpur}"
pathC="${txtgrn}"
gitC="${txtpur}"
pointerC="${txtgrn}"
normalC="${txtwht}"

# Red name for root
if [ "${UID}" -eq "0" ]; then 
  nameC="${txtred}" 
fi

# Patent Pending Prompt
export PS1="${nameC}\u${atC}@${hostC}\h:${pathC}\w${gitC}\$(gitPrompt)${pointerC}▶${normalC} "

# Local settings go last
if [ -f ~/.localrc ]; then 
  source ~/.localrc
fi

#cool ideas but too advance:
#alias norg="gron --ungron"
#alias ungron="gron --ungron"
#alias j="jobs"
#export GIT_SSL_NO_VERIFY=true

#alias follow="tail -f -n +1"

# Personal binaries
#export PATH=${PATH}:~/bin:~/.local/bin:~/etc/scripts

# I'd quite like for Go to work please.
#export PATH=${PATH}:/usr/local/go/bin
#export GOPATH=~

