#IMPORTS

import os
import subprocess
import psutil
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

@hook.subscribe.startup_once
def autostart():
	home = os.path.expanduser('~/.config/qtile/autostart.sh')
	subprocess.Popen([home])
	
mod = "mod4"
terminal = guess_terminal()

keys = [
   
    # Switch between windows
    Key([mod], "z", lazy.spawn("light -U 10")),
    Key([mod], "x", lazy.spawn("light -A 10")),
   # Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
  #  Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "w", lazy.spawn("virt-manager")),
    Key([mod], "k", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "j", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "Tab", lazy.group.next_window(), desc="Focus next window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
  #  Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
  #  Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "t", lazy.window.disable_floating(), desc="Disable floating window"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    #Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod, "shift"], "i", lazy.spawn("gedit .config/qtile/config.py"), desc="Launch config file"),
    Key([mod, "shift"], "l", lazy.spawn("light-locker-command --lock"), desc="Launch lock screen"),
    Key([mod], "p", lazy.spawn("dmenu_run"), desc="Launch dmenu"),
    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "q", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "shift"], "p", lazy.spawn("gnome-screenshot"), desc="Screenshot"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),    
    
    # Launch Applications
   
    Key([mod, "shift"], "b", lazy.spawn("brave"), desc="Launch Brave"),
    Key([mod, "shift"], "n", lazy.spawn("nemo"), desc="Launch Nemo"),
  #  Key([mod, "shift"], "s", lazy.spawn("gajim"), desc="Launch Gajim"),    
    Key([mod, "shift"], "g", lazy.spawn("gedit"), desc="Launch Gedit"),
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
       
            Key(
            	[mod, "shift"], 
            	i.name, 
            	lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name)
            ),
        ]
    )

layouts = [

    # layout.Floating(**layout_theme)

    #layout.Stack(num_stacks=2),
    #layout.Bsp(border_width = 3, margin = 10, border_focus = '#ff57ff'),
    #layout.Matrix(),
     layout.MonadTall(border_width = 3, margin = 20, border_focus = '#cc52cd'),
     layout.MonadTall(border_width = 3, margin = 0, border_focus = '#cc52cd'),
     layout.MonadWide(border_width = 3, margin = 20, border_focus = '#cc52cd'),
     layout.Max(border_width = 2, margin = 20, border_focus = '#cc52cd'),
    #layout.Floating(border_width = 2, margin = 15, border_focus = '#ffffff')
    # layout.RatioTile(),     
     layout.Tile(),
]
#282c34   6c6c6c
#### BAR COLORS ####
#def init_colors():
colors = [["#282c34", "#6c6c6c", "#282c34"], # panel background
		["#ffffff", "#ffffff"], # background for current screen tab
		["#1c1f24", "#1c1f24"], # font color for group names
		["#dfdfdf", "#dfdfdf"], # background color for layout widget
		["#ff6c6b", "#ff6c6b"], # background for other screen tabs
		["#98be65", "#98be65"], # dark green gradiant for other screen tabs
		["#da8548", "#da8548"], # background color for network widget
		["#51afef", "#51afef"], # background color for pacman widget
		["#c678dd", "#c678dd"], # background color for cmus widget
		["#46d9ff", "#46d9ff"], # background color for clock widget
		["#a9a1e1", "#a9a1e1"]] # background color for systray widget

#### GROUPS ####

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
            	widget.Sep(linewidth = 0, 
            		padding = 6,
            		foreground = colors[2],
            		background = colors[0]
            		),
            		
            	widget.CPU(
			format = '   CPU: {load_percent}%',
            		foreground = colors[1],
                		background = colors[0]
            		),
       
            	widget.Memory(
            		fmt = '   Mem: {}',

            		foreground = colors[1],
            		background = colors[0]
            		),
            		
            	widget.OpenWeather(
                	location='Laval',
                	format = ' {main_temp} {units_temperature}',
                	background = colors[0],
                	foreground = colors[1]
                	),  
     		
		widget.Spacer(
			background = colors [0]
			),
			
	widget.TextBox(
  	     	 text = ' ',
          	 font = "Ubuntu Mono",
         	 background = colors[0],
           	 foreground = colors[1],
          	 padding = 2,
           	 fontsize = 20
            ),
            
widget.GroupBox(font="Ubuntu Bold",
           		fontsize = 12,
            		margin_y = 3,
            		margin_x = 0,
            		padding_y = 5,
            		padding_x = 3,
            		borderwidth = 3,
           		active = colors[1],
            		inactive = colors [8],
            		rounded = True,
            		highlight_method = "block",
           		highlight_color = colors[1],
            		this_current_screen_border = colors[8],
            		this_screen_border = colors [4],
           		other_current_screen_border = colors[6],
            		other_screen_border = colors[3],
            		foreground = colors[2],
            		background = colors[0],       
            		mouse_callbacks={}		
            		),

		 widget.TextBox(
  	     	 text = 'XT OS',
          	 font = "Ubuntu Mono",
         	 background = colors[0],
           	 foreground = colors[1],
          	 padding = 2,
           	 fontsize = 11
            ),
            		
            	widget.Spacer(
            		background = colors[0]
            		),
            		
        widget.TextBox(
            		text = '|',
           		font = "Ubuntu Mono",
           		background = colors[0],
            		foreground = colors[1],
            		padding = 2,
            		fontsize = 14
            		),

		widget.Systray(
                	background = colors[0]
                	),
                	
                widget.TextBox(
           		text = '|',
            		font = "Ubuntu Mono",
            		background = colors[0],
           		foreground = colors[1],
          		padding = 2,
           		fontsize = 14
            		),
            		
                widget.Battery(
                	format = "   {percent:0.1%}",
              	 	foreground = colors[3],
                	background = colors[0]
                	),
                	
                widget.Volume(
			background = colors[0],
			mouse_callbacks={},
			fmt='   {}'
			),
			 
                widget.Clock(
               		foreground = colors[1],
              		background = colors[0],
               		format=" %b %d %Y - %H:%M "
             		),
             	
              	widget.Sep(linewidth = 0, 
           		padding = 6,
            		foreground = colors[2],
            		background = colors[0]
            		),
            ],
            24,
            margin=8,
	    opacity=1.0,
            border_radius=[16, 16, 16, 16],  # corner radius

        ),
    
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
