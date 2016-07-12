# i3 config file (v4)
#
# i3-specific configuration
#

# Display configuration
exec --no-startup-id xrandr --output HDMI1 --mode 1680x1050 --pos 0x0 --rotate normal --output HDMI2 --primary --mode 1680x1050 --pos 1680x0 --rotate normal --output HDMI3 --mode 1680x1050 --pos 3360x0 --rotate normal

# Wallpaper
exec --no-startup-id feh --bg-fill ~/wallpapers/Red-Tesla-Emblem-Logo-Water.jpg

# Compositing with compton
exec --no-startup-id compton --config ~/.config/compton.conf -b

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 10 px or 10 ppt
        bindsym $down       resize grow height 10 px or 10 ppt
        bindsym $up         resize shrink height 10 px or 10 ppt
        bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 10 px or 10 ppt
        bindsym Down        resize grow height 10 px or 10 ppt
        bindsym Up          resize shrink height 10 px or 10 ppt
        bindsym Right       resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym Mod1+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    status_command i3blocks -c ~/.config/i3blocks/i3blocks.conf
    mode dock
    tray_output HDMI2
    font pango:Hack, Icons, Ubuntu Mono, DejaVu Sans Mono 11
    workspace_buttons yes
    strip_workspace_numbers yes
}

### Configuration common to both i3 and sway
#
# Window handling
for_window [window_role="popup"] floating enable
for_window [class="Termite" instance="termite" title="cava"] border pixel 2
for_window [class="chromium" instance="crx_fahmaaghhglfmonjliepjlchgpgfmobi" title="Google Play Music" window_role="app"] border pixel 2

# Font for_window titles.
font pango:Hack, Ubuntu Mono, DejaVu Sans Mono 10

### Variables
#
# Super key. Use Mod1 for Alt.
set $mod Mod4
# Your preferred terminal emulator
set $term termite
# Your preferred application launcher
set $menu j4-dmenu-desktop --dmenu='dmenu -i -s 0 -x 420 -y 525 -w 840 -dim .75'

# use these keys for focus, movement, and resize directions when reaching for
# the arrows is not convenient
set $left j
set $down k
set $up l
set $right semicolon

### Key bindings
#
# Basics:
#
    # start a terminal
    bindsym $mod+Return exec $term

    # kill focused window
    bindsym $mod+Shift+q kill

    # start your launcher
    bindsym $mod+d exec $menu

    # Drag floating windows by holding down $mod and left mouse button.
    # Resize them with right mouse button + $mod.
    # Despite the name, also works for non-floating windows in sway.
    floating_modifier $mod

    # reload the configuration file
    bindsym $mod+Shift+c reload

    # restart inplace (preserves your layout/session, can be used to upgrade)
    bindsym $mod+Shift+r restart

    # exit (logs you out of your session)
    bindsym $mod+Shift+e exit
# exit i3 (logs you out of your X session)
bindsym Mod1+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

#
# Moving around:
#
    # Move your focus around with $mod+[h|j|k|l], like vim
    bindsym $mod+$left focus left
    bindsym $mod+$down focus down
    bindsym $mod+$up focus up
    bindsym $mod+$right focus right
    # or use $mod+[up|down|left|right]
    bindsym $mod+Left focus left
    bindsym $mod+Down focus down
    bindsym $mod+Up focus up
    bindsym $mod+Right focus right

    # _move_ the focused window with the same, but add Shift
    bindsym $mod+Shift+$left move left
    bindsym $mod+Shift+$down move down
    bindsym $mod+Shift+$up move up
    bindsym $mod+Shift+$right move right
    # ditto, with arrow keys
    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+Right move right
#
# Workspaces:
#
    # switch to workspace
    bindsym $mod+1 workspace 1
    bindsym $mod+2 workspace 2
    bindsym $mod+3 workspace 3
    bindsym $mod+4 workspace 4
    bindsym $mod+5 workspace 5
    bindsym $mod+6 workspace 6
    bindsym $mod+7 workspace 7
    bindsym $mod+8 workspace 8
    bindsym $mod+9 workspace 9
    bindsym $mod+0 workspace 10
    # move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace 1
    bindsym $mod+Shift+2 move container to workspace 2
    bindsym $mod+Shift+3 move container to workspace 3
    bindsym $mod+Shift+4 move container to workspace 4
    bindsym $mod+Shift+5 move container to workspace 5
    bindsym $mod+Shift+6 move container to workspace 6
    bindsym $mod+Shift+7 move container to workspace 7
    bindsym $mod+Shift+8 move container to workspace 8
    bindsym $mod+Shift+9 move container to workspace 9
    bindsym $mod+Shift+0 move container to workspace 10
#
# Layout stuff:
#
    # You can "split" the current object of your focus with
    # $mod+h or $mod+v, for horizontal and vertical splits
    # respectively.
    bindsym $mod+h splith
    bindsym $mod+v splitv

    # Switch the current container between different layout styles
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    # Make the current focus fullscreen
    bindsym $mod+f fullscreen

    # Toggle the current focus between tiling and floating mode
    bindsym $mod+Shift+space floating toggle

    # Swap focus between the tiling area and the floating area
    bindsym $mod+space focus mode_toggle

    # move focus to the parent container
    bindsym $mod+a focus parent

    # focus the child container
    #bindsym $mod+d focus child
#
# Scratchpad:
#
    # There is a "scratchpad", which is a bag of holding for_windows.
    # You can send windows there and get them back later.

    # Move the currently focused window to the scratchpad
    bindsym $mod+Shift+minus move scratchpad

    # Show the next scratchpad window or hide the focused scratchpad window.
    # If there are multiple scratchpad windows, this command cycles through them.
    bindsym $mod+minus scratchpad show
