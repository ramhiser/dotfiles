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
  ln -s ~/Dropbox/novi ~/novi
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ramey/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ramey/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ramey/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ramey/Downloads/google-cloud-sdk/completion.bash.inc'; fi
