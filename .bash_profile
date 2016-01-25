################################
### ENVIRONMENTAL VARIABLES ###
################################


# Build initial PATH
 PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin
 if [ -d "/opt/subversion" ]; then
   PATH=/opt/subversion/bin:$PATH
 fi


 # Update PATH. Add coreutils.
 PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"


 # Update PATH. Use rbenv to dynamically select which Ruby to use.
 if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi




   if [ -f $(brew --prefix)/etc/bash_completion ]; then
       source $(brew --prefix)/etc/bash_completion
   fi


 # Export final ENV variables
 export PATH


 #Optional:
 # echo "export EDITOR='subl -w'" >> ~/.bash_profile
 # ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl


 #################################
 ### ALIASES AND CUSTOMIZATION ###
 #################################


 PS1="\[\033[0;36m\][\W]\[\033[0m\]\$"
 export PS1="\n$PS1"


#COLORS
cyan=`tput setaf 6`
magenta=`tput setaf 5`
reset=`tput sgr0`

function google() { open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1"; }

 # simple ip
 #alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
 # more details
 #alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
 # external ip
 #alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"




# up 'n' folders
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias pivotal="open /Applications/Google\ Chrome.app/ \"https://www.pivotaltracker.com/n/projects/1492036\"";
alias slack="open -a \"Slack\""

alias reload='source ~/.bash_profile'
alias bash_profile='atom ~/.bash_profile'
alias repros='cd /Users/Ben/Repros/'

alias chrome="open -a \"Google Chrome\""
alias stfu="osascript -e 'set volume output muted true'"
alias cl="fc -e -|pbcopy"
alias clr="clear" # Clear your terminal screen
alias ls="ls -a"



# Git Aliases
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='echo ""; echo "${cyan}*********************************************"; echo -e "${reset}   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "${cyan}*********************************************"; echo ${reset}""; git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch -vv'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'


complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_checkout gc
