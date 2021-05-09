# Use ls colors by default
# Need to use gls due to coreutils install from brew
alias ls="gls --color=always --group-directories-first --indicator-style=slash"
alias l="ls -Ahl"
alias lc="ls --format=single-column"

alias ..='cd ..'

# git stuff
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcn='git commit -v --no-verify'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch --prune'
alias gl='git pull origin HEAD'
alias glg='git log --abbrev-commit --date=relative --stat'
alias glo='git log --oneline'
alias gm='git merge'
alias gp='git push origin HEAD'
alias gpn='git push origin HEAD --no-verify'
alias gr='git rebase'
alias gss='git status --short'

# this always happens
alias :q='exit'
alias cp='cp -R'

# Always enable colored `grep` output
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'

# Ignore common "junk" folders
alias tree='tree -I "node_modules"'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Reload zshrc
alias reload='exec zsh'