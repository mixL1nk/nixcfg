_:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "mixlink";
    autoMigrate = true;
  };
  
  environment.variables.HOMEBREW_NO_ANALYTICS = "1";
  homebrew = {
    enable = true;
    taps = [
      "homebrew/services"
      "FelixKratz/formulae"
    ];
    brews = [
      "lua"
      "readline"
      "switchaudio-osx"
      "nowplaying-cli"
      {
        name = "sketchybar";
        start_service = true;
        restart_service = "changed";
      }
    ];

    casks = [
      # fonts
      "font-sf-pro"
      "font-sf-mono"
      "sf-symbols"
      "font-d2coding"
      # browser
      "google-chrome"
      # terminal
      "ghostty"

      # productivity
      "chatgpt"
      "notion"
      "obsidian"
      "proton-mail"
      "zoom"
      "jump"
      # dev
      "visual-studio-code"
      "cursor"
      "windsurf"
      # vm
      "utm"
      # utilities
      "input-source-pro"
      "karabiner-elements"
      "dropbox"
      "raycast"
      "1password"
      "1password-cli"
    ];
  };
}