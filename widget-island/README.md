# Omarchy Widget Island

A compact floating top-right panel for Omarchy 4 / Quickshell.

## Install

Run `./install.sh`, then add this to `~/.config/hypr/bindings.lua`:

`o.bind("SUPER + SHIFT + I", "Widget Island", "omarchy-shell shell toggle local.widget-island")`

Run `hyprctl reload` and press **Super + Shift + I**.

## Customize

Edit `~/.config/omarchy/plugins/local.widget-island/Island.qml`. It starts with a clock and three empty widget slots. Replace or duplicate the slots with your own QML widgets.

After changes, run `omarchy restart shell`.

## Remove

`omarchy plugin remove local.widget-island`
