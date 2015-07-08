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

# Python Stuff
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Homebrew Stuff
export HOMEBREW_EDITOR=/usr/local/bin/emacs

# API Keys
if [ -f ~/.api_keys ]; then
  source ~/.api_keys
fi 
