dotfiles
========

Personal macOS setup files and bootstrap script.

`init.sh` provides a small set of setup commands:

- `./init.sh link`: create symlinks for every `*.symlink` file into `$HOME`
- `./init.sh brew`: install Homebrew if needed, then install packages from `Brewfile`
- `./init.sh def`: apply macOS defaults such as key repeat and Finder settings
- `./init.sh vim`: install Vim and bootstrap NeoBundle
- `./init.sh fisher`: install Fish plugins with `fisher`

Typical usage:

```sh
./init.sh link
./init.sh brew
```

Files ending in `.symlink` are linked into the home directory with the leading dot restored. For example, `zshrc.symlink` becomes `~/.zshrc`.
