# Apache Spark
export SPARK_HOME="$HOME/spark-1.6.0"

export PATH=~/scripts:~/local/bin:/usr/local/bin:$SPARK_HOME/bin:$PATH

alias ll='ls -lah'

# Enable X11 forwarding by default when SSH'ing
# The '-C' argument compresses the forwarded X11 data.
alias ssh='ssh -XC'

# Bash/Git Autocomplete
# http://stackoverflow.com/a/14970926/234233
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# The colors are used with the Solarized dark color theme.
# They make look terrible if Solarized is not installed.
# Here's the link to Solarized:
# http://ethanschoonover.com/solarized
#
# I used the following website to generate my prompt:
# http://www.linuxhelp.net/guides/bashprompt/bashprompt-print.php
#
# There, I used the following code:
# <green>(<white>\d<yellow>@<white>\@<green>) (<white>\u<yellow>@<white>\h<green>) (<white>\W<green>)<space>$<space>
#
# NOTE: I added the last part manually to get my font color after I generated the prompt on the site.
# Here's the font color: \[\033[0;38m\]
PS1="\[\033[0;32m\](\[\033[1;37m\]\\d\[\033[1;33m\]@\[\033[1;37m\]\\@\[\033[0;32m\])(\[\033[1;37m\]\\u\[\033[1;33m\]@\[\033[1;37m\]\\h\[\033[\
0;32m\])(\[\033[1;37m\]\\W\[\033[0;32m\]) $ \[\033[0;38m\]"
export PS1

# R Stuff
alias R='R --no-save --no-restore-data --quiet'

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

# Pretty JSON
alias prettyjson='python -m json.tool'

# Basic Web Server from Paul Irish
# Source: https://www.youtube.com/watch?v=f7AU2Ozu8eo
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}
# Docker
# Get IP of Docker container. Append Docker container ID.
# Example: dockerip bf6e22a1f331
alias dockerip='docker inspect --format "{{ .NetworkSettings.IPAddress }}"'
