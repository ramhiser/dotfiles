# dotfiles

Configuration files for text editors and other tools.

## Setting Things Up

After cloning the repository, create symbolic links from repository to `~`. For
example, to create a symbolic link to `.bashrc`, run:

```
ln -s dotfiles/.bashrc ~/.bashrc
```

To do this via `make`, run:

```
make setup
```

Currently, `make setup` adds a symbolic link to `./git/` -- added a TODO to fix it. Maybe will fix later.