{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    yabai
    skhd
    jankyborders
  ];

  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;
    style="round";
    active_color="0xc0e2e2e3";
    inactive_color="0xc02c2e34";
    background_color="0x302c2e34";
    width=6.0;
  };

  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;
    config = {
      external_bar = "all:40:0";
      focus_follows_mouse = "off";
      window_placement = "second_child";
      window_topmost = "off";
      window_shadow = "float";
      window_opacity = "on";
      active_window_opacity = "1.0";
      normal_window_opacity = "0.90";
      window_border = "off";
      window_border_width = "6";
      insert_feedback_color = "0xffd75f5f";
      split_ratio = "0.50";
      auto_balance = "off";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      mouse_follows_focus = "off";
      layout = "bsp";
      top_padding = "10";
      bottom_padding = "10";
      left_padding = "10";
      right_padding = "10";
      window_gap = "10";
    };
    extraConfig = ''
      sudo yabai --load-sa
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

      # Exclude problematic apps from being managed:
      yabai -m rule --add app="^(LuLu|Calculator|Software Update|Dictionary|VLC|System Preferences|System Settings|zoom.us|Photo Booth|Archive Utility|Python|LibreOffice|App Store|Steam|Alfred|Activity Monitor)$" manage=off
      yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
      yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
      yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
      yabai -m rule --add label="Select file to save to" app="^Inkscape$" title="Select file to save to" manage=off

    '';
  };

  services.skhd = {
    enable = true;
    skhdConfig = ''
      # focus space
      lalt - 1 : SPACES=($(yabai -m query --displays --display | jq '.spaces[]')) && [[ -n $SPACES[1] ]] && yabai -m space --focus $SPACES[1]
      lalt - 2 : SPACES=($(yabai -m query --displays --display | jq '.spaces[]')) && [[ -n $SPACES[2] ]] && yabai -m space --focus $SPACES[2]
      lalt - 3 : SPACES=($(yabai -m query --displays --display | jq '.spaces[]')) && [[ -n $SPACES[3] ]] && yabai -m space --focus $SPACES[3]
      lalt - 4 : SPACES=($(yabai -m query --displays --display | jq '.spaces[]')) && [[ -n $SPACES[4] ]] && yabai -m space --focus $SPACES[4]

      # create desktop space, move window and follow focus - uses jq for parsing json (brew install jq)
      ctrl + lalt - s : yabai -m space --create && \
                        index="$(yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == false))[-1].index')" && \
                        yabai -m window --space "\$\{index\}" && \
                        yabai -m space --focus "\$\{index\}"

      # focus windows
      lalt - h : yabai -m window --focus west || yabai -m display --focus west
      lalt - l : yabai -m window --focus east || yabai -m display --focus east
      lalt - k : yabai -m window --focus north || yabai -m display --focus north
      lalt - j : yabai -m window --focus south || yabai -m display --focus south

      lalt - w : yabai -m window --focus first
      lalt - e : yabai -m window --focus last

      # Float / Unfloat window: lalt - space
      lalt - space : yabai -m window --toggle float

      ## zoom window
      # Make window zoom to fullscreen: shift + lalt - f
      shift + lalt - f : yabai -m window --toggle zoom-fullscreen
      # Make window zoom to parent node: lalt - f 
      lalt - f : yabai -m window --toggle zoom-parent

      ## move window
      # Move window to the next space: shift + lalt - {h,j,k,l}
      shift + lalt - h : yabai -m window --warp west || $(yabai -m window --display west && yabai -m display --focus west && yabai -m window --warp last) || yabai -m window --move rel:-10:0
      shift + lalt - j : yabai -m window --warp south || $(yabai -m window --display south && yabai -m display --focus south) || yabai -m window --move rel:0:10
      shift + lalt - k : yabai -m window --warp north || $(yabai -m window --display north && yabai -m display --focus north) || yabai -m window --move rel:0:-10
      shift + lalt - l : yabai -m window --warp east || $(yabai -m window --display east && yabai -m display --focus east && yabai -m window --warp first) || yabai -m window --move rel:10:0

      # Toggle split orientation of the selected windows node: shift + lalt - s
      shift + lalt - s : yabai -m window --toggle split


      # Moving windows between spaces: shift + lalt - {1, 2, 3, 4, p, n } (Assumes 4 Spaces Max per Display)
      shift + lalt - 1 : SPACES=($(yabai -m query --displays --display | jq '.spaces[]')) && [[ -n $SPACES[1] ]] \
                        && yabai -m window --space $SPACES[1]

      shift + lalt - 2 : SPACES=($(yabai -m query --displays --display | jq '.spaces[]')) && [[ -n $SPACES[2] ]] \
                        && yabai -m window --space $SPACES[2]

      shift + lalt - 3 : SPACES=($(yabai -m query --displays --display | jq '.spaces[]')) && [[ -n $SPACES[3] ]] \
                        && yabai -m window --space $SPACES[3]

      shift + lalt - 4 : SPACES=($(yabai -m query --displays --display | jq '.spaces[]')) && [[ -n $SPACES[4] ]] \
                        && yabai -m window --space $SPACES[4]


      shift + lalt - p : yabai -m window --space prev && yabai -m space --focus prev
      shift + lalt - n : yabai -m window --space next && yabai -m space --focus next

      # Mirror Space on X and Y Axis: shift + lalt - {x, y}
      shift + lalt - x : yabai -m space --mirror x-axis
      shift + lalt - y : yabai -m space --mirror y-axis


      ## Stacks (shift + ctrl - ...)
      # Add the active window to the window or stack to the {direction}: shift + ctrl - {j, k, l, ö}
      shift + ctrl - h    : yabai -m window  west --stack $(yabai -m query --windows --window | jq -r '.id')
      shift + ctrl - j    : yabai -m window south --stack $(yabai -m query --windows --window | jq -r '.id')
      shift + ctrl - k    : yabai -m window north --stack $(yabai -m query --windows --window | jq -r '.id')
      shift + ctrl - l : yabai -m window  east --stack $(yabai -m query --windows --window | jq -r '.id')

      # Stack Navigation: shift + ctrl - {n, p}
      shift + ctrl - n : yabai -m window --focus stack.next
      shift + ctrl - p : yabai -m window --focus stack.prev


      ## Resize (ctrl + lalt - ...)
      # Resize windows: ctrl + lalt - {j, k, l, ö}
      ctrl + lalt - h    : yabai -m window --resize right:-100:0 || yabai -m window --resize left:-100:0
      ctrl + lalt - j    : yabai -m window --resize bottom:0:100 || yabai -m window --resize top:0:100
      ctrl + lalt - k    : yabai -m window --resize bottom:0:-100 || yabai -m window --resize top:0:-100
      ctrl + lalt - l    : yabai -m window --resize right:100:0 || yabai -m window --resize left:100:0

      # Enable / Disable gaps in current workspace: ctrl + lalt - g
      ctrl + lalt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

      ## Insertion (shift + ctrl + lalt - ...)
      # Set insertion point for focused container: shift + ctrl + lalt - {j, k, l, ö, s}
      shift + ctrl + lalt - h : yabai -m window --insert west
      shift + ctrl + lalt - j : yabai -m window --insert south
      shift + ctrl + lalt - k : yabai -m window --insert north
      shift + ctrl + lalt - l : yabai -m window --insert east
      shift + ctrl + lalt - s : yabai -m window --insert stack

      # New window in hor./ vert. splits for all applications with yabai
      lalt - s : yabai -m window --insert east;  skhd -k "cmd - n"
      lalt - v : yabai -m window --insert south; skhd -k "cmd - n"
    '';
  };
}