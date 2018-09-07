export PATH=~/scripts:~/local/bin:/usr/local/bin:/Users/ramey/miniconda3/bin:/usr/local/opt/gnu-getopt/bin:$PATH

alias ll='ls -lah'

# Enable X11 forwarding by default when SSH'ing
# The '-C' argument compresses the forwarded X11 data.
alias ssh='ssh -XC'

# Bash/Git Autocomplete
# http://stackoverflow.com/a/14970926/234233
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

# R Stuff
alias R='R --no-save --no-restore-data --quiet'

# Fixes a brew-related pathing issue.
# Otherwise, get the annoying error...
#   Library not loaded: /usr/local/opt/gcc/lib/gcc/5/libgfortran.3.dylib
# Source: http://stackoverflow.com/a/30291779/234233
export DYLD_LIBRARY_PATH=/usr/local/Cellar/gcc/6.1.0/lib/gcc/6/

# Python Stuff
# Source: https://stackoverflow.com/a/43458830/234233
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

# Homebrew Stuff
export HOMEBREW_EDITOR=/usr/local/bin/emacs

# LaTeX Stuff
# Source: http://stackoverflow.com/a/29239327/234233
ln -f -s /usr/bin/texi2dvi /usr/local/bin/texi2dvi
ln -f -s /usr/bin/texi2pdf /usr/local/bin/texi2pdf

# Java Stuff
# Note: I downloaded SDK from Oracle's site
# Other details from: http://stackoverflow.com/a/6588410/234233
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export PATH=$JAVA_HOME/bin:$PATH

# API Keys
if [ -f ~/.api_keys ]; then
  source ~/.api_keys
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

# Kubernetes
export KOPS_CLUSTER_NAME=ramhiser.k8s.local
export KOPS_STATE_STORE=s3://ramhiser-kops-state-store
export KUBE_EDITOR=emacs

# AWS

# Switch AWS Profiles Easily: https://github.com/johnnyopao/awsp
alias awsp="source _awsp"

# https://github.com/novilabs/handbook/blob/master/new-machine/ssh-agent.md
SSH_ENV="${HOME}/.ssh/environment"

function start_agent {
     >&2 echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     >&2 echo "Success creating ssh agent env file"
     chmod 600 ${SSH_ENV}
     source ${SSH_ENV} > /dev/null

     # Auto-add all relevant keys
     /usr/bin/ssh-add ~/.ssh/*.pem ~/.ssh/*_rsa;
}

# Source SSH settings, if applicable
if [[ -f "${SSH_ENV}" ]]; then
     source ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
