{ pkgs, lib, config, ... }:

{
  home = {
    stateVersion = "25.05";
    sessionVariables = {
        XDG_CONFIG_HOME = "$HOME/.config";
        EDITOR = "hx";
        NO_ZELLIJ_AUTO_START = if config.home.sessionVariables.TERM_PROGRAM or "" == "vscode" then "1" else "";
      };
    packages = with pkgs; [
      htop
      curl
      coreutils
      jq
      monaspace
      ripgrep
      fd
      eza 
      gnumake
      gcc
      delta
      skim
      nixfmt-rfc-style
    ];
  };

  imports = [
    ./shell.nix
    ./ssh.nix
    ./git.nix
    ./ghostty.nix
    ./karabiner.nix
    ./zellij.nix
    ./sketchybar.nix
  ];

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv.enable = true;
}