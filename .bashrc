alias ll='ls -lah'

export PATH=:~/scripts:~/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/gnu-getopt/bin:$PATH

# Homebrew Stuff
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_EDITOR=/usr/local/bin/emacs

## Bash/Git Autocomplete
## http://stackoverflow.com/a/14970926/234233
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

# R Stuff
alias R='R --no-save --no-restore-data --quiet'

# GCC
# Use versioned GCC installed via homebrew
# Based on: https://apple.stackexchange.com/a/120715
# Additional Source: https://github.com/microsoft/LightGBM/issues/1369#issuecomment-513427706
USE_GCC_HOMEBREW=false

if [ "$USE_GCC_HOMEBREW" = true ] ; then
    echo "Using GCC 9 installed with Homebrew..."
    export CXX=/usr/local/bin/g++-9
    export CC=/usr/local/bin/gcc-9
    export CPP=/usr/local/bin/cpp-9
    export LD=/usr/local/bin/gcc-9
    alias c++=/usr/local/bin/c++-9
    alias g++=/usr/local/bin/g++-9
    alias gcc=/usr/local/bin/gcc-9
    alias cpp=/usr/local/bin/cpp-9
    alias ld=/usr/local/bin/gcc-9
    alias cc=/usr/local/bin/gcc-9
else
    echo "Using Apple's built-in clang instead of GCC 9..."
    export CC=/usr/bin/gcc
    export CXX=/usr/bin/g++
    export CPP=/usr/bin/cpp
    export LD=/usr/bin/ld
    alias c++=/usr/bin/c++
    alias g++=/usr/bin/g++
    alias gcc=/usr/bin/gcc
    alias cpp=/usr/bin/cpp
    alias cc=/usr/bin/gcc
    alias ld=/usr/bin/ld
fi

# Redshift ODBC
# Source: https://docs.aws.amazon.com/redshift/latest/mgmt/odbc-driver-configure-linux-mac.html
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib
export ODBCINI=/Users/ramey/Library/ODBC/odbc.ini
export AMAZONREDSHIFTODBCINI=/etc/amazon.redshiftodbc.ini
export ODBCSYSINI=/Users/ramey/Library/ODBC

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
alias urlencode='python -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'
alias urldecode='python -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'

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

# SSH
# From old Novi handbook
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

# pyenv
# Source: Output from `pyenv init`
# Source: https://github.com/pyenv/pyenv-virtualenv#installing-with-homebrew-for-macos-users
# Source: https://github.com/pyenv/pyenv/issues/1906#issuecomment-835027647
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# direnv
eval "$(direnv hook bash)"
