{ pkgs, lib, config, ... }:

{
  home.activation.createGhosttyConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ${config.home.homeDirectory}/.config/ghostty
  '';

  home.file.".config/ghostty/config" = {
    text = ''
      theme = catppuccin-mocha
      window-padding-x = 10,10
      window-padding-y = 10,10
      macos-option-as-alt = true
      mouse-scroll-multiplier = 0.7
      background-opacity = 0.95
      font-family = Monaspace Argon
      font-thicken = true
      font-size = 16
      cursor-style = block
      cursor-style-blink = true
      cursor-invert-fg-bg = true
      shell-integration-features = no-cursor
    '';
  };
}
