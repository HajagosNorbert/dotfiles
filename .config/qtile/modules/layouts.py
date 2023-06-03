from libqtile import layout
from libqtile.config import Match

layouts = [
    layout.MonadTall(margin=0,
                     border_focus='#5294e2',
                     single_border_width=0
                     #border_normal='#2c5380'
                     ),
    layout.Max(),
    layout.Bsp(), # seems good, can resize
    # Try more layouts by unleashing below layouts.
    # layout.MonadWide(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
