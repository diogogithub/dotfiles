# Private overlay (never commit its contents)

Everything in this directory is ignored except this documentation and the
`templates/` examples. Keep the public repository clone on an encrypted disk if
this directory contains private keys.

Supported overlay locations:

- `private/common/home/`: copied into `$HOME`;
- `private/hosts/<hostname>/home/`: host-specific home overlay;
- `private/common/system/`: copied below `/` only with `private-apply --system`;
- `private/hosts/<hostname>/system/`: host-specific root overlay;
- `private/common/gnupg/import/` and host equivalent: exported OpenPGP keys to
  import with `gpg --import`;
- `ownertrust.txt`: optional GnuPG ownertrust export.

Recommended files:

```text
private/common/home/.ssh/config
private/common/home/.ssh/id_ed25519
private/common/home/.ssh/id_ed25519.pub
private/common/gnupg/import/private-keys.asc
private/common/gnupg/ownertrust.txt
private/common/system/etc/dotfiles-private/restic.env
private/common/system/etc/dotfiles-private/restic-password
```

Use `./private-apply --agent auto` to apply the home overlay, import GPG
material, and configure an SSH agent. Add `--system` to install the root overlay.
The script never creates or exports keys; it only installs material you place
here.
