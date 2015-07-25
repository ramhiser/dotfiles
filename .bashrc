export PATH=~/scripts:~/local/bin:/usr/local/bin:$PATH

# Never save or restore when running R
alias R='R --no-save --no-restore-data --quiet'

# Enable X11 forwarding by default when SSH'ing
# The '-C' argument compresses the forwarded X11 data.
alias ssh='ssh -XC'

# Bash/Git Autocomplete
# http://stackoverflow.com/a/14970926/234233
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Bash Prompt
# Source: https://github.com/mathiasbynens/dotfiles
# TODO: Fork this profile and borrow all the useful things. Lots of 'em!
source ~/.bash_prompt

# Python Stuff
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Homebrew Stuff
export HOMEBREW_EDITOR=/usr/local/bin/emacs

# Java Stuff
# Note: I downloaded SDK from Oracle's site
# Other details from: http://stackoverflow.com/a/6588410/234233
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# API Keys
if [ -f ~/.api_keys ]; then
  source ~/.api_keys
fi 
# Utilities

# URL Encode and Decode (from Anthony McClosky)
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

# Basic Web Server from Paul Irish
# Source: https://www.youtube.com/watch?v=f7AU2Ozu8eo
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}


