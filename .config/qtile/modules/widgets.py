from libqtile import widget
from libqtile import qtile

colors = [
	      ["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]  # backbround for inactive screens
] 


widget_defaults = dict(
    font='Cantarell',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()
class MyVolume(widget.Volume):
    def _configure(self, qtile, bar):
        widget.Volume._configure(self, qtile, bar)

    def _update_drawer(self, wob=False):
        vol, muted = self.get_volume()
        if muted:
            self.text = f'\U0001f507 ' 
        elif vol <= 15:
            self.text = f'   {vol}%'
        elif vol < 50:
            self.text = f'   {vol}%'
        else:
            self.text = f'   {vol}%'
        self.draw()

        if wob:
            with open(self.wob, 'a') as f:
                f.write(str(vol) + "\n")

volume = MyVolume(
# volume = widget.Volume(
    fontsize=16,
    foreground='#dddddd',
    background='#2f343f',
    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")}
)
