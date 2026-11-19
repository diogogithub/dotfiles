# Finalized keyboard remapping

The same `/etc/keyd/default.conf` is used on the desktop and laptop.

The desktop keyboard observed with `keyd monitor` was:

```text
BY Tech Gaming Keyboard 258a:010c:3d952825
```

The ABNT2 `/ ?` key reports itself as `ro`, so the shared mapping contains:

```ini
ro = rightshift
```

Effective behaviour:

- Caps Lock becomes Control;
- the ABNT2 `ro` key becomes Right Shift;
- Left Control activates a `Ctrl+Alt+Meta+Shift` Hyper layer;
- Left Control + Caps Lock produces actual Caps Lock.

On the laptop, Right Alt remains outside keyd and acts as AltGr through XKB.
Apply the persistent setting with:

```sh
./system-setup --xkb-abnt2 on
```

For the current X11 session, when needed:

```sh
setxkbmap -layout br -model abnt2 -option lv3:ralt_switch
```

Do not add `rightalt = rightalt` to keyd; it is a no-op and does not configure
AltGr semantics.

This records the last finalized shared setup. It is not a live read of either
machine's current `/etc/keyd/default.conf`.
