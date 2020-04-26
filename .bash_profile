if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.keys ]; then
  source ~/.keys
fi

if [ -f ~/.novi_bashrc ]; then
  source ~/.novi_bashrc
fi

# Creates symbolic links from various subfolders in ~/Dropbox/ to ~/
# This allows for a more consistent structure across my many computers.
if [ ! -L ~/scripts ]; then
  ln -s ~/Dropbox/scripts/ ~/scripts
fi

if [ ! -L ~/Rpackages ]; then
  ln -s ~/Dropbox/Rpackages/ ~/Rpackages
fi

if [ ! -L ~/projects ]; then
  ln -s ~/Dropbox/projects/ ~/projects
fi

if [ ! -L ~/papers ]; then
  ln -s ~/Dropbox/papers/ ~/papers
fi

if [ ! -L ~/blog ]; then
  ln -s ~/Dropbox/blog/ ~/blog
fi

if [ ! -L ~/novi ]; then
  ln -s ~/Dropbox/novi/ ~/novi
fi

if [ ! -L ~/notebooks ]; then
  ln -s ~/Dropbox/novi/code/notebooks/ ~/notebooks
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

