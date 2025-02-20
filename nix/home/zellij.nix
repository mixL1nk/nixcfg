{ ... }: {
  programs.zellij = { enable = true; };

  home.file.".config/zellij/config.kdl" = {
    text = ''
keybinds clear-defaults=true {
    locked {
        bind "Ctrl g" { SwitchToMode "normal"; }
    }
    normal {
        bind "Ctrl h" { MoveFocusOrTab "left"; }
        bind "Ctrl j" { MoveFocus "down"; }
        bind "Ctrl k" { MoveFocus "up"; }
        bind "Ctrl l" { MoveFocusOrTab "right"; }
        bind "Ctrl g" { SwitchToMode "locked"; }
    }
    pane {
        bind "left" { MoveFocus "left"; }
        bind "down" { MoveFocus "down"; }
        bind "up" { MoveFocus "up"; }
        bind "right" { MoveFocus "right"; }
        bind "c" { SwitchToMode "renamepane"; PaneNameInput 0; }
        bind "d" { NewPane "down"; SwitchToMode "locked"; }
        bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "locked"; }
        bind "f" { ToggleFocusFullscreen; SwitchToMode "locked"; }
        bind "h" { MoveFocus "left"; }
        bind "j" { MoveFocus "down"; }
        bind "k" { MoveFocus "up"; }
        bind "l" { MoveFocus "right"; }
        bind "n" { NewPane; SwitchToMode "locked"; }
        bind "p" { SwitchToMode "normal"; }
        bind "r" { NewPane "right"; SwitchToMode "locked"; }
        bind "w" { ToggleFloatingPanes; SwitchToMode "locked"; }
        bind "x" { CloseFocus; SwitchToMode "locked"; }
        bind "z" { TogglePaneFrames; SwitchToMode "locked"; }
        bind "tab" { SwitchFocus; }
    }
    tab {
        bind "left" { GoToPreviousTab; }
        bind "down" { GoToNextTab; }
        bind "up" { GoToPreviousTab; }
        bind "right" { GoToNextTab; }
        bind "1" { GoToTab 1; SwitchToMode "locked"; }
        bind "2" { GoToTab 2; SwitchToMode "locked"; }
        bind "3" { GoToTab 3; SwitchToMode "locked"; }
        bind "4" { GoToTab 4; SwitchToMode "locked"; }
        bind "5" { GoToTab 5; SwitchToMode "locked"; }
        bind "6" { GoToTab 6; SwitchToMode "locked"; }
        bind "7" { GoToTab 7; SwitchToMode "locked"; }
        bind "8" { GoToTab 8; SwitchToMode "locked"; }
        bind "9" { GoToTab 9; SwitchToMode "locked"; }
        bind "[" { BreakPaneLeft; SwitchToMode "locked"; }
        bind "]" { BreakPaneRight; SwitchToMode "locked"; }
        bind "b" { BreakPane; SwitchToMode "locked"; }
        bind "h" { GoToPreviousTab; }
        bind "j" { GoToNextTab; }
        bind "k" { GoToPreviousTab; }
        bind "l" { GoToNextTab; }
        bind "n" { NewTab; SwitchToMode "locked"; }
        bind "r" { SwitchToMode "renametab"; TabNameInput 0; }
        bind "s" { ToggleActiveSyncTab; SwitchToMode "locked"; }
        bind "t" { SwitchToMode "normal"; }
        bind "x" { CloseTab; SwitchToMode "locked"; }
        bind "tab" { ToggleTab; }
    }
    resize {
        bind "left" { Resize "Increase left"; }
        bind "down" { Resize "Increase down"; }
        bind "up" { Resize "Increase up"; }
        bind "right" { Resize "Increase right"; }
        bind "+" { Resize "Increase"; }
        bind "-" { Resize "Decrease"; }
        bind "=" { Resize "Increase"; }
        bind "H" { Resize "Decrease left"; }
        bind "J" { Resize "Decrease down"; }
        bind "K" { Resize "Decrease up"; }
        bind "L" { Resize "Decrease right"; }
        bind "h" { Resize "Increase left"; }
        bind "j" { Resize "Increase down"; }
        bind "k" { Resize "Increase up"; }
        bind "l" { Resize "Increase right"; }
        bind "r" { SwitchToMode "normal"; }
    }
    move {
        bind "left" { MovePane "left"; }
        bind "down" { MovePane "down"; }
        bind "up" { MovePane "up"; }
        bind "right" { MovePane "right"; }
        bind "h" { MovePane "left"; }
        bind "j" { MovePane "down"; }
        bind "k" { MovePane "up"; }
        bind "l" { MovePane "right"; }
        bind "m" { SwitchToMode "normal"; }
        bind "n" { MovePane; }
        bind "p" { MovePaneBackwards; }
        bind "tab" { MovePane; }
    }
    scroll {
        bind "Alt left" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
        bind "Alt down" { MoveFocus "down"; SwitchToMode "locked"; }
        bind "Alt up" { MoveFocus "up"; SwitchToMode "locked"; }
        bind "Alt right" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
        bind "e" { EditScrollback; SwitchToMode "locked"; }
        bind "f" { SwitchToMode "entersearch"; SearchInput 0; }
        bind "Alt h" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
        bind "Alt j" { MoveFocus "down"; SwitchToMode "locked"; }
        bind "Alt k" { MoveFocus "up"; SwitchToMode "locked"; }
        bind "Alt l" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
        bind "s" { SwitchToMode "normal"; }
    }
    search {
        bind "c" { SearchToggleOption "CaseSensitivity"; }
        bind "n" { Search "down"; }
        bind "o" { SearchToggleOption "WholeWord"; }
        bind "p" { Search "up"; }
        bind "w" { SearchToggleOption "Wrap"; }
    }
    session {
        bind "c" {
            LaunchOrFocusPlugin "configuration" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "locked"
        }
        bind "d" { Detach; }
        bind "o" { SwitchToMode "normal"; }
        bind "p" {
            LaunchOrFocusPlugin "plugin-manager" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "locked"
        }
        bind "w" {
            LaunchOrFocusPlugin "session-manager" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "locked"
        }
    }
    shared_among "normal" "locked" {
        bind "Alt left" { MoveFocusOrTab "left"; }
        bind "Alt down" { MoveFocus "down"; }
        bind "Alt up" { MoveFocus "up"; }
        bind "Alt right" { MoveFocusOrTab "right"; }
        bind "Alt +" { Resize "Increase"; }
        bind "Alt -" { Resize "Decrease"; }
        bind "Alt =" { Resize "Increase"; }
        bind "Alt [" { PreviousSwapLayout; }
        bind "Alt ]" { NextSwapLayout; }
        // collision with yabai with skhd
        // bind "Alt f" { ToggleFloatingPanes; }
        // bind "Alt i" { MoveTab "left"; }
        bind "Ctrl h" { MoveFocusOrTab "left"; }
        bind "Ctrl j" { MoveFocus "down"; }
        bind "Ctrl k" { MoveFocus "up"; }
        bind "Ctrl l" { MoveFocusOrTab "right"; }
        bind "Alt n" { NewPane; }
        bind "Alt o" { MoveTab "right"; }
    }
    shared_except "locked" "renametab" "renamepane" {
        bind "Ctrl g" { SwitchToMode "locked"; }
        bind "Ctrl q" { Quit; }
    }
    shared_except "locked" "entersearch" {
        bind "enter" { SwitchToMode "locked"; }
    }
    shared_except "locked" "entersearch" "renametab" "renamepane" {
        bind "esc" { SwitchToMode "locked"; }
    }
    shared_except "locked" "entersearch" "renametab" "renamepane" "move" {
        bind "m" { SwitchToMode "move"; }
    }
    shared_except "locked" "entersearch" "search" "renametab" "renamepane" "session" {
        bind "o" { SwitchToMode "session"; }
    }
    shared_except "locked" "tab" "entersearch" "renametab" "renamepane" {
        bind "t" { SwitchToMode "tab"; }
    }
    shared_except "locked" "tab" "scroll" "entersearch" "renametab" "renamepane" {
        bind "s" { SwitchToMode "scroll"; }
    }
    shared_among "normal" "resize" "tab" "scroll" "prompt" "tmux" {
        bind "p" { SwitchToMode "pane"; }
    }
    shared_except "locked" "resize" "pane" "tab" "entersearch" "renametab" "renamepane" {
        bind "r" { SwitchToMode "resize"; }
    }
    shared_among "scroll" "search" {
        bind "PageDown" { PageScrollDown; }
        bind "PageUp" { PageScrollUp; }
        bind "left" { PageScrollUp; }
        bind "down" { ScrollDown; }
        bind "up" { ScrollUp; }
        bind "right" { PageScrollDown; }
        bind "Ctrl b" { PageScrollUp; }
        bind "Ctrl c" { ScrollToBottom; SwitchToMode "locked"; }
        bind "d" { HalfPageScrollDown; }
        bind "Ctrl f" { PageScrollDown; }
        bind "h" { PageScrollUp; }
        bind "j" { ScrollDown; }
        bind "k" { ScrollUp; }
        bind "l" { PageScrollDown; }
        bind "u" { HalfPageScrollUp; }
    }
    entersearch {
        bind "Ctrl c" { SwitchToMode "scroll"; }
        bind "esc" { SwitchToMode "scroll"; }
        bind "enter" { SwitchToMode "search"; }
    }
    renametab {
        bind "esc" { UndoRenameTab; SwitchToMode "tab"; }
    }
    shared_among "renametab" "renamepane" {
        bind "Ctrl c" { SwitchToMode "locked"; }
    }
    renamepane {
        bind "esc" { UndoRenamePane; SwitchToMode "pane"; }
    }
}

plugins {
    compact-bar location="zellij:compact-bar"
    configuration location="zellij:configuration"
    filepicker location="zellij:strider" {
        cwd "/"
    }
    plugin-manager location="zellij:plugin-manager"
    session-manager location="zellij:session-manager"
    status-bar location="zellij:status-bar"
    strider location="zellij:strider"
    tab-bar location="zellij:tab-bar"
    welcome-screen location="zellij:session-manager" {
        welcome_screen true
    }
}

load_plugins {
}

    '';
};

home.file.".config/zellij/layouts/default.kdl" = {
  text = ''
layout {
    default_tab_template {
        pane size=1 borderless=true {
            plugin location="https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm" {
                 // -- Catppuccin Mocha --
                color_rosewater "#f5e0dc"
                color_flamingo "#f2cdcd"
                color_pink "#f5c2e7"
                color_mauve "#cba6f7"
                color_red "#f38ba8"
                color_maroon "#eba0ac"
                color_peach "#fab387"
                color_yellow "#f9e2af"
                color_green "#a6e3a1"
                color_teal "#94e2d5"
                color_sky "#89dceb"
                color_sapphire "#74c7ec"
                color_blue "#89b4fa"
                color_lavender "#b4befe"
                color_text "#cdd6f4"
                color_subtext1 "#bac2de"
                color_subtext0 "#a6adc8"
                color_overlay2 "#9399b2"
                color_overlay1 "#7f849c"
                color_overlay0 "#6c7086"
                color_surface2 "#585b70"
                color_surface1 "#45475a"
                color_surface0 "#313244"
                color_base "#1e1e2e"
                color_mantle "#181825"
                color_crust "#11111b"

                // -- Catppuccin Latte --
                //color_rosewater "#dc8a78"
                //color_flamingo "#dd7878"
                //color_pink "#ea76cb"
                //color_mauve "#8839ef"
                //color_red "#d20f39"
                //color_maroon "#e64553"
                //color_peach "#fe640b"
                //color_yellow "#df8e1d"
                //color_green "#40a02b"
                //color_teal "#179299"
                //color_sky "#04a5e5"
                //color_sapphire "#209fb5"
                //color_blue "#1e66f5"
                //color_lavender "#7287fd"
                //color_text "#4c4f69"
                //color_subtext1 "#5c5f77"
                //color_subtext0 "#6c6f85"
                //color_overlay2 "#7c7f93"
                //color_overlay1 "#8c8fa1"
                //color_overlay0 "#9ca0b0"
                //color_surface2 "#acb0be"
                //color_surface1 "#bcc0cc"
                //color_surface0 "#ccd0da"
                //color_base "#eff1f5"
                //color_mantle "#e6e9ef"
                //color_crust "#dce0e8"

                // -- Catppuccin Frappé --
                //color_rosewater "#f2d5cf"
                //color_flamingo "#eebebe"
                //color_pink "#f4b8e4"
                //color_mauve "#ca9ee6"
                //color_red "#e78284"
                //color_maroon "#ea999c"
                //color_peach "#ef9f76"
                //color_yellow "#e5c890"
                //color_green "#a6d189"
                //color_teal "#81c8be"
                //color_sky "#99d1db"
                //color_sapphire "#85c1dc"
                //color_blue "#8caaee"
                //color_lavender "#babbf1"
                //color_text "#c6d0f5"
                //color_subtext1 "#b5bfe2"
                //color_subtext0 "#a5adce"
                //color_overlay2 "#949cbb"
                //color_overlay1 "#838ba7"
                //color_overlay0 "#737994"
                //color_surface2 "#626880"
                //color_surface1 "#51576d"
                //color_surface0 "#414559"
                //color_base "#303446"
                //color_mantle "#292c3c"
                //color_crust "#232634"

                // -- Catppuccin Macchiato --
                //color_rosewater "#f4dbd6"
                //color_flamingo "#f0c6c6"
                //color_pink "#f5bde6"
                //color_mauve "#c6a0f6"
                //color_red "#ed8796"
                //color_maroon "#ee99a0"
                //color_peach "#f5a97f"
                //color_yellow "#eed49f"
                //color_green "#a6da95"
                //color_teal "#8bd5ca"
                //color_sky "#91d7e3"
                //color_sapphire "#7dc4e4"
                //color_blue "#8aadf4"
                //color_lavender "#b7bdf8"
                //color_text "#cad3f5"
                //color_subtext1 "#b8c0e0"
                //color_subtext0 "#a5adcb"
                //color_overlay2 "#939ab7"
                //color_overlay1 "#8087a2"
                //color_overlay0 "#6e738d"
                //color_surface2 "#5b6078"
                //color_surface1 "#494d64"
                //color_surface0 "#363a4f"
                //color_base "#24273a"
                //color_mantle "#1e2030"
                //color_crust "#181926"

                format_left   "#[bg=$surface0,fg=$sapphire]#[bg=$sapphire,fg=$crust,bold] {session} #[bg=$surface0] {mode}#[bg=$surface0] {tabs}"
                format_center "{notifications}"
                format_right  "#[bg=$surface0,fg=$flamingo]#[fg=$crust,bg=$flamingo] #[bg=$surface1,fg=$flamingo,bold] {command_user}@{command_host}#[bg=$surface0,fg=$surface1]#[bg=$surface0,fg=$maroon]#[bg=$maroon,fg=$crust]󰃭 #[bg=$surface1,fg=$maroon,bold] {datetime}#[bg=$surface0,fg=$surface1]"
                format_space  "#[bg=$surface0]"
                format_hide_on_overlength "true"
                format_precedence "lrc"

                border_enabled  "false"
                border_char     "─"
                border_format   "#[bg=$surface0]{char}"
                border_position "top"

                hide_frame_for_single_pane "true"

                mode_normal        "#[bg=$green,fg=$crust,bold] NORMAL#[bg=$surface0,fg=$green]"
                mode_tmux          "#[bg=$mauve,fg=$crust,bold] TMUX#[bg=$surface0,fg=$mauve]"
                mode_locked        "#[bg=$red,fg=$crust,bold] LOCKED#[bg=$surface0,fg=$red]"
                mode_pane          "#[bg=$teal,fg=$crust,bold] PANE#[bg=$surface0,fg=teal]"
                mode_tab           "#[bg=$teal,fg=$crust,bold] TAB#[bg=$surface0,fg=$teal]"
                mode_scroll        "#[bg=$flamingo,fg=$crust,bold] SCROLL#[bg=$surface0,fg=$flamingo]"
                mode_enter_search  "#[bg=$flamingo,fg=$crust,bold] ENT-SEARCH#[bg=$surfaco,fg=$flamingo]"
                mode_search        "#[bg=$flamingo,fg=$crust,bold] SEARCHARCH#[bg=$surfac0,fg=$flamingo]"
                mode_resize        "#[bg=$yellow,fg=$crust,bold] RESIZE#[bg=$surfac0,fg=$yellow]"
                mode_rename_tab    "#[bg=$yellow,fg=$crust,bold] RENAME-TAB#[bg=$surface0,fg=$yellow]"
                mode_rename_pane   "#[bg=$yellow,fg=$crust,bold] RENAME-PANE#[bg=$surface0,fg=$yellow]"
                mode_move          "#[bg=$yellow,fg=$crust,bold] MOVE#[bg=$surface0,fg=$yellow]"
                mode_session       "#[bg=$pink,fg=$crust,bold] SESSION#[bg=$surface0,fg=$pink]"
                mode_prompt        "#[bg=$pink,fg=$crust,bold] PROMPT#[bg=$surface0,fg=$pink]"

                tab_normal              "#[bg=$surface0,fg=$blue]#[bg=$blue,fg=$crust,bold]{index} #[bg=$surface1,fg=$blue,bold] {name}{floating_indicator}#[bg=$surface0,fg=$surface1]"
                tab_normal_fullscreen   "#[bg=$surface0,fg=$blue]#[bg=$blue,fg=$crust,bold]{index} #[bg=$surface1,fg=$blue,bold] {name}{fullscreen_indicator}#[bg=$surface0,fg=$surface1]"
                tab_normal_sync         "#[bg=$surface0,fg=$blue]#[bg=$blue,fg=$crust,bold]{index} #[bg=$surface1,fg=$blue,bold] {name}{sync_indicator}#[bg=$surface0,fg=$surface1]"
                tab_active              "#[bg=$surface0,fg=$peach]#[bg=$peach,fg=$crust,bold]{index} #[bg=$surface1,fg=$peach,bold] {name}{floating_indicator}#[bg=$surface0,fg=$surface1]"
                tab_active_fullscreen   "#[bg=$surface0,fg=$peach]#[bg=$peach,fg=$crust,bold]{index} #[bg=$surface1,fg=$peach,bold] {name}{fullscreen_indicator}#[bg=$surface0,fg=$surface1]"
                tab_active_sync         "#[bg=$surface0,fg=$peach]#[bg=$peach,fg=$crust,bold]{index} #[bg=$surface1,fg=$peach,bold] {name}{sync_indicator}#[bg=$surface0,fg=$surface1]"
                tab_separator           "#[bg=$surface0] "

                tab_sync_indicator       " "
                tab_fullscreen_indicator " 󰊓"
                tab_floating_indicator   " 󰹙"

                notification_format_unread "#[bg=surface0,fg=$yellow]#[bg=$yellow,fg=$crust] #[bg=$surface1,fg=$yellow] {message}#[bg=$surface0,fg=$yellow]"
                notification_format_no_notifications ""
                notification_show_interval "10"

                command_host_command    "uname -n"
                command_host_format     "{stdout}"
                command_host_interval   "0"
                command_host_rendermode "static"

                command_user_command    "whoami"
                command_user_format     "{stdout}"
                command_user_interval   "10"
                command_user_rendermode "static"

                datetime          "{format}"
                datetime_format   "%Y-%m-%d 󰅐 %H:%M"
                datetime_timezone "Asia/Seoul"
            }
        }
        children
    }
}
  '';
};
}