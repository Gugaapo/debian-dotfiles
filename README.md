# dotfiles

Public mirror of personal Debian dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

> **Note:** This repo contains only non-sensitive configs. Credentials and
> private configs live in a separate private repo which is the source of truth.
> Do not edit files here directly — changes should be made in `dotfiles-private`.

## Packages

| Package     | Contents                                                         |
|-------------|------------------------------------------------------------------|
| `bash`      | `.bashrc`, `.profile`                                            |
| `git`       | `.gitconfig`                                                     |
| `alacritty` | `.config/alacritty/`                                             |
| `vscode`    | `.config/Code/User/settings.json`, `snippets/`                   |
| `ohmybash`  | `.oh-my-bash/custom/` (aliases, scripts, binaryanomaly theme)    |

## Install on a new machine

```bash
# 1. Install dependencies
sudo apt-get install -y stow rsync

# 2. Clone this repo
git clone https://github.com/Gugaapo/debian-dotfiles.git ~/dotfiles

# 3. Stow all packages
cd ~/dotfiles
stow bash git alacritty vscode ohmybash
```

## Add a new dotfile

```bash
# 1. Move the file into the right package (mirroring the path from ~)
mv ~/.config/foo/bar.conf ~/dotfiles/foo/.config/foo/bar.conf

# 2. Stow the package
cd ~/dotfiles && stow foo
```

## Remove a package (unstow)

```bash
cd ~/dotfiles
stow -D <package>
```
