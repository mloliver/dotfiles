p() { cd ~/Projects/$1; }
_p() { _files -W ~/Projects -/; }
compdef _c c

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

# autocorrect is more annoying than helpful
unsetopt correct_all

# command line history
bindkey '^R' history-incremental-search-backward

# a few aliases I like
alias ptt='rake parallel:test'
alias pts='rake parallel:spec'
alias combo='rake db:migrate parallel:migrate db:schema:dump'
alias mysql='mysql -u root'
alias mysql-dir='cd /usr/local/var/mysql/'
alias psql='psql -U bohdan postgres'
alias redis-status='redis-cli ping'
for dbname in mysql postgresql couchdb redis; do
  eval "function ${dbname}-start() { launchctl load ~/Library/LaunchAgents/homebrew.mxcl.${dbname}.plist }"
  eval "function ${dbname}-stop() { launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.${dbname}.plist }"
done