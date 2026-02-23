# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package     | Contents                                                   |
|-------------|-------------------------------------------------------------|
| `bash`      | `.bashrc`, `.profile`                                       |
| `git`       | `.gitconfig`                                                |
| `alacritty` | `.config/alacritty/`                                        |
| `vscode`    | `.config/Code/User/settings.json`, `snippets/`              |
| `ohmybash`  | `.oh-my-bash/custom/` (aliases, scripts, binaryanomaly theme) |

## Install on a new machine

```bash
# 1. Install stow
sudo apt-get install -y stow   # Debian/Ubuntu
# brew install stow             # macOS

# 2. Clone this repo
git clone https://github.com/Gugaapo/debian-dotfiles.git ~/dotfiles

# 3. Stow all packages
cd ~/dotfiles
stow bash git alacritty vscode ohmybash
```

## Add a new dotfile

1. Move the file into the right package directory (mirroring the path relative to `~`).
2. Run `stow <package>` from `~/dotfiles`.

Example — add a new config file to the `git` package:
```bash
mv ~/.config/git/ignore ~/dotfiles/git/.config/git/ignore
cd ~/dotfiles && stow git
```

## Remove a package (unstow)

```bash
cd ~/dotfiles
stow -D <package>
```
