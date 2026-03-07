# GNOME Settings

Applies GNOME desktop settings via gsettings — keyboard shortcuts, tiling, workspaces, app switching, input methods, and dock behavior.

Run as the non-root user from the repo root:

```bash
install/gsettings.sh
```

## Dash-to-dock: click-action values

```
gsettings set org.gnome.shell.extensions.dash-to-dock click-action '<value>'
```

- Focus: Makes the window active and brings it to the foreground. Restores it if minimized.
- Overview: Zooms out all apps in the workspace, including those other than the clicked one. Only available when multiple windows are open.
- Previews: Shows thumbnail previews of the app's windows next to the dock. Only available when multiple windows are open.
- Appspread: Zooms out only the windows of the clicked app in the workspace. Only available when multiple windows are open.

How to read:
- Action when unfocused `>` action when focused
- Action when one window `|` action when multiple windows

| Value                         | Behavior                            |
|-------------------------------|-------------------------------------|
| `skip`                        | Focus > None.                       |
| `cycle-windows`               | Focus > (None \| Cycle).            |
| `previews`                    | (Focus > None) \| Previews.         |
| `minimize`                    | Focus > Minimize.                   |
| `minimize-or-overview`        | (Focus > Minimize) \| Overview.     |
| `minimize-or-previews`        | (Focus > Minimize) \| Previews.     |
| `focus-or-previews`           | Focus > (None \| Previews).         |
| `focus-or-appspread`          | Focus > (None \| Appspread).        |
| `focus-minimize-or-previews`  | Focus > (Minimize \| Previews).     |
| `focus-minimize-or-appspread` | Focus > (Minimize \| Appspread).    |
| `launch`                      | Launches a new instance of the app. |
| `quit`                        | Quits the app.                      |
