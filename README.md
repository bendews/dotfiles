# dotfiles

My barebones dotfiles. Get a fresh Mac up and running in less time than it takes to do it manually.

Uses `1Password` to store secret files as a tar archive, uses `stow` to restore dotfiles to correct locations (including secrets).

## Steps

1. Check that your Brewfile is up to date and push any changes to this repository
2. [Erase your disk](https://support.apple.com/en-us/HT208496) and [reinstall macOS](https://support.apple.com/en-us/HT204904)
3. Clone this Git repository and run the scripts

## Usage

Install Xcode command line tools

```sh
xcode-select --install
```

Clone this repository

```
git clone https://github.com/bendews/dotfiles.git ~/.dotfiles
```

Change into the directory

```
cd ~/.dotfiles
```

Install everything

```
./up all
```

(Optional) Only install apps

```
./up apps
```

(Optional) Only install .dotfiles

```
./up stow
```

## Brewfile

A Brewfile lists all your Homebrew dependencies. 

Generate a Brewfile by running the following command: 

```bash
brew bundle dump
```

If a Brewfile already exists, you can overwrite it by adding `--force`

```bash
brew bundle dump --force
```

You can search for Homebrew formulae on [https://formulae.brew.sh](https://formulae.brew.sh) 

## Appreciation

The popular [dotfiles](https://dotfiles.github.io) do a lot and instead of just forking them, I wanted to write my own dotfiles.

- some install scripts were plucked from [Sahil Bajaj](https://github.com/spinningarrow/)'s [up](https://github.com/spinningarrow/up)
- some macOS preferences were picked from [Mathias Bynens](https://github.com/mathiasbynens/)' [dotfiles](https://github.com/mathiasbynens/dotfiles/blob/master/.macos)
- other ideas where inspired by [Zach Holman](https://github.com/holman)'s [dotfiles](https://github.com/holman/dotfiles)
