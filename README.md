# Dotfiles

## Getting Started

Install [rcm](https://github.com/thoughtbot/rcm).

```sh
git clone git@github.com:jiahaog/dotfiles.git ~/dotfiles

cat <<EOT >> $HOME/.rcrc
DOTFILES_DIRS="$HOME/gdotfiles $HOME/dotfiles"
EXCLUDES="old README.md"
EOT

rcup
```

## Known Issues

### VSCode

Not using this for sync since rcm has some issues syncing things in the `Application Support` directory (note the space). See https://github.com/thoughtbot/rcm/issues/235.
