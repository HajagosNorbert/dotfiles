# from Qmin import qmin
from libqtile.lazy import lazy
from libqtile.config import Key
import os

mod = "mod4"
terminal = "alacritty"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], 'space', lazy.next_screen(), desc='Next monitor'),

    Key([mod], "r", lazy.spawn("rofi -show combi"), desc="spawn rofi"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"],
        "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        desc="Grow window to the left"),
    Key([mod, "control"],
        "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        desc="Grow window to the right"),
    Key([mod, "control"],
        "j",
        lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc='Toggle floating'),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc='Toggle fullscreen'),
    # Key([mod, "shift"], "m", qmin(), desc="Qmin unminimizer"),
    # Key([mod], "m", lazy.window.toggle_minimize(), lazy.group.next_window(), desc="Minimize window"),


    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q",lazy.spawn(os.path.expanduser('~/.config/rofi/powermenu.sh')) , desc="Bring up power menu"),
    Key([mod, "shift"],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),


    # Volume
    Key([], "XF86AudioRaiseVolume",lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +3%"), desc="Increase master volume"),
    Key([], "XF86AudioLowerVolume",lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -3%"), desc="Decrease master volume"),
    Key([], "XF86AudioMute",lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc="Mute volume"),

    # Brightness
    Key([], "XF86MonBrightnessUp",lazy.spawn("brightnessctl set 1%+"), desc="Increase brightness"),
    Key([], "XF86MonBrightnessDown",lazy.spawn("brightnessctl set 1%-"), desc="Decrease brightness"),

    # Screenshot
    Key([], "Print",lazy.spawn("xfce4-screenshooter"), desc="Take a screenshot"),

]
