# -*- encoding: utf-8 -*-

# Window move/resize steps in pixel per keypress
set :increase_step, 5

# Window screen border snapping
set :border_snap, 10

# Default starting gravity for windows. Comment out to use gravity of
# currently active client
set :default_gravity, :center

# Make dialog windows urgent and draw focus
set :urgent_dialogs, false

# Honor resize size hints globally
set :honor_size_hints, false

# Enable gravity tiling for all gravities
set :gravity_tiling, false

# Enable click-to-focus focus model
set :click_to_focus, false

# Skip pointer movement on e.g. gravity change
set :skip_pointer_warp, false

# Skip pointer movement to urgent windows
set :skip_urgent_warp, false

# Set the WM_NAME of subtle (Java quirk)
set :wmname, "LG3D"

# == Screen

screen 1 do
  top    [ :views, :separator, :title, :spacer, :tray, :sublets ]
  bottom [ ]
end

# == Styles
#
# Styles define various properties of styleable items in a CSS-like syntax.
#
# If no background color is given no color will be set. This will ensure a
# custom background pixmap won't be overwritten.
#
# Following properties are available for most the styles:
#
# [*foreground*] Foreground text color
# [*background*] Background color
# [*margin*]     Outer spacing
# [*border*]     Border color and size
# [*padding*]    Inner spacing
# [*font*]       Font string (xftontsel or xft)
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Styles

# Style for all style elements
style :all do
  background  "#1d1f21"
  icon        "#006aff"
  border      "#303030", 0
  padding     0, 2
  font        "xft:Terminus-8"
end

# Style for the all views
style :views do
  foreground  "#004eba"

  # Style for the active views
  style :focus do
    foreground  "#006aff"
  end

  # Style for urgent window titles and views
  style :urgent do
    foreground  "#0057d1"
  end

  # Style for occupied views (views with clients)
  style :occupied do
    foreground  "#0057d1"
  end
end

# Style for sublets
style :sublets do
  foreground  "#006aff"
end

# Style for separator
style :separator do
  foreground  "#006aff"
  separator   "|"
end

# Style for focus window title
style :title do
  foreground  "#006aff"
end

# Style for active/inactive windows
style :clients do
  active    "#303030", 2
  inactive  "#202020", 2
  margin    0
  width     50
end

# Style for subtle
style :subtle do
  margin      0, 0, 0, 0
  panel       "#202020"
  background  "#1d1f21"
  stipple     "#757575"
end

# == Gravities

# Top left
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  75 ]
gravity :top_left33,     [   0,   0,  50,  25 ]

# Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  75 ]
gravity :top33,          [   0,   0, 100,  25 ]

# Top right
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  75 ]
gravity :top_right33,    [  50,   0,  50,  25 ]

# Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  75, 100 ]
gravity :left33,         [   0,   0,  25, 100 ]

# Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center33,       [  25,  25,  50,  50 ]

# Right
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  25,   0,  75, 100 ]
gravity :right33,        [  75,   0,  25, 100 ]

# Bottom left
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  25,  50,  75 ]
gravity :bottom_left33,  [   0,  75,  50,  25 ]

# Bottom
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  25, 100,  75 ]
gravity :bottom33,       [   0,  75, 100,  25 ]

# Bottom right
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  25,  50,  75 ]
gravity :bottom_right33, [  50,  75,  50,  25 ]

# == Grabs

# Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4

# Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4

# Select next and prev view */
grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev

# Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-C-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "W-f", :WindowFloat

# Toggle fullscreen mode of window
grab "W-space", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "W-S-s", :WindowStick

# Toggle zaphod mode of window (will span across all screens)
grab "W-equal", :WindowZaphod

# Raise window
grab "W-r", :WindowRaise

# Lower window
grab "W-l", :WindowLower

# Select next windows
grab "W-h", :WindowLeft
grab "W-j", :WindowDown
grab "W-k", :WindowUp
grab "W-l", :WindowRight
grab "W-Left", :WindowLeft
grab "W-Down", :WindowDown
grab "W-Up", :WindowUp
grab "W-Right", :WindowRight

# Kill current window
grab "A-F4", :WindowKill

grab "A-F2", "dmenu_run"

# Cycle between given gravities
grab "W-q", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-w", [ :top,          :top66,          :top33          ]
grab "W-e", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-a", [ :left,         :left66,         :left33         ]
grab "W-s", [ :center,       :center33                        ]
grab "W-d", [ :right,        :right66,        :right33        ]
grab "W-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# Exec programs
#grab "W-Return", "urxvt"
grab "W-Return", "termite"

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

# == Tags

# Simple tags
tag "terms",   "xterm|[u]?rxvt|termite"
tag "browser", "uzbl|opera|firefox|navigator|google-chrome"
tag "game",    "encoded|metroid|steve|\^!m"

# Placement
tag "editor" do
  match  "[g]?vim"
  resize true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "resize" do
  match  "sakura|gvim"
  resize true
end

tag "gravity" do
  gravity :center
end

# Modes
tag "stick" do
  match "mplayer"
  float true
  stick true
end

tag "float" do
  match "display"
  float true
end

# == Views

view "terms", "terms"
view "www",   "browser"
view "game",  "game|default"

# == Sublets
sublet :clock do
  interval      30
  format_string "%H:%M"
end

# vim:ts=2:bs=2:sw=2:et:fdm=marker
