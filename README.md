# Dotfiles

Linux workstation configuration for openSUSE and Debian. GNU Stow links the files into the home directory. Dash runs system scripts. Kitty opens Zsh as a login shell without changing the user's account shell.

## Install

```sh
git clone https://github.com/diogogithub/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap --profile i3-xfce --install --dry-run
./bootstrap --profile i3-xfce --install
```

Choose the `i3-xfce` profile for a native X11 i3 session with Xfce services. The separate `kde` profile does not combine Plasma with i3. The `common` and `minimal` profiles install fewer desktop files. No profile changes the display manager or logs out the current session.

`bootstrap` installs Dash when necessary, then runs `apply`. After installation, run `./apply` and `./revert` directly. Run `./apply --profile i3-xfce --list-packages` to inspect the package lists.

## Profiles and packages

Profiles list Stow directories in `config/stow-profiles/`. Distribution-specific package lists live in `config/packages/`. The install script treats `*.required` packages as mandatory and attempts `*.optional` packages separately.

The `i3-xfce` profile uses i3, Xfce settings and power management, Picom, NetworkManager's applet, Rofi and i3blocks. Host-specific monitor commands belong in `~/.config/i3/config.d/90-host.conf`.

The `i3-xfce` profile starts the normal `xfsettingsd`, which applies Xfce mouse preferences and GTK settings. Xfce application shortcuts can conflict with i3. To disable them for the user account, first back up the `xfce4-keyboard-shortcuts` channel and then clear the custom shortcuts and override the defaults:

```sh
backup="$HOME/.local/state/dotfiles/xfce-shortcuts-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup"
xfconf-query -c xfce4-keyboard-shortcuts -lv > "$backup/shortcuts.txt"
source_file="$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"
[ ! -f "$source_file" ] || cp -p "$source_file" "$backup/"
for group in commands xfwm4; do
    xfconf-query -c xfce4-keyboard-shortcuts -p "/$group/custom" -R -r || :
    xfconf-query -c xfce4-keyboard-shortcuts -p "/$group/custom/override" -n -t bool -s true
done
```

This is a one-time account-wide change. It also disables shortcuts in the standalone Xfce session. Restart the graphical session afterwards. Mouse, touchpad and GTK settings remain unchanged. Numix can be selected in Xfce Appearance settings, and the i3bar still uses its own theme.

On openSUSE, install Numix GTK packages from the distribution and the icon themes from their official sources:

```sh
sudo zypper install gtk2-metatheme-numix gtk3-metatheme-numix parcellite
./scripts/install-numix-icons
```

The i3bar shows XEmbed tray applications. Parcellite starts automatically, and Nextcloud uses the user's XDG autostart entry. Applications that publish only StatusNotifierItem icons need `snixembed`, which the profile starts if installed. It is not part of the default Tumbleweed package list. The `i3blocks` clock updates every second.

A named login entry can be installed locally. Host-specific migration scripts are intentionally not tracked.

## i3 appearance

Window borders use the original i3 greys (`#444444` focused, `#2f343f` inactive), rather than the default blue. The focused workspace is grey as well. GTK themes do not set i3 window colors.

## Backups and rollback

`apply` backs up conflicting files below `~/.local/state/dotfiles/backups/` before linking replacements. It writes a manifest for `revert`. Check proposed changes first:

```sh
./apply --profile i3-xfce --dry-run
./apply --profile i3-xfce --install
```

To switch profiles, run `./revert --dry-run` and `./revert`, then apply the new profile. Keep a separate backup before migrating a configured machine. The Stow backup covers linked paths, not the whole home directory.

## Bitwarden SSH agent

Enable the SSH agent in the Bitwarden desktop application. Select it for shell sessions with:

```sh
./private-apply --agent bitwarden
```

The shell uses the native Linux socket at `~/.bitwarden-ssh-agent.sock`, or the Flatpak socket if Bitwarden is installed as a Flatpak. The socket only works while Bitwarden is running and its SSH agent is enabled.

The i3 profile installs an autostart entry for Bitwarden. The launcher checks standard executable and AppImage locations. If an AppImage has a different location, use a stable symlink at `~/Applications/Bitwarden.AppImage`. Do not use a path under `/tmp/.mount_*`.

## Local files and private data

The `private/` directory supports files for an individual host. `./private-apply --dry-run` lists its planned changes. `./private-apply --agent none` applies them without configuring an SSH agent.

Personal Git identity and signing options belong in `~/.config/git/local.conf`. Host-specific configuration stays outside the tracked Stow files. Do not commit credentials.

## System maintenance

System changes are opt-in:

```sh
./system-setup --upgrades full --dry-run
./system-setup --keyd on --dry-run
./system-setup --backups on --dry-run
```

On Tumbleweed, full updates use `zypper dup`. Backup setup uses Restic and needs credentials configured under `/etc/dotfiles-private/`. Keyboard remapping is in `system/keyd/default.conf`.

## Validation

GitHub Actions checks shell syntax, ShellCheck, Lua files, i3 configuration and apply/revert round trips on Debian and openSUSE. Run `tests/roundtrip.sh` under Dash to test Stow locally.

License: MIT.
