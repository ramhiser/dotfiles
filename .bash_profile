if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.keys ]; then
  source ~/.keys
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

if [ ! -L ~/todo ]; then
  ln -s ~/Dropbox/todo/ ~/todo
fi

if [ ! -L ~/novi ]; then
  ln -s ~/Dropbox/novi ~/novi
fi
