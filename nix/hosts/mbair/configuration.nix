{ pkgs, ... } @ args:

let
  username = "mixlink";
  mkImports = import ../../lib/mkImports.nix args;
in
{
  
  imports = mkImports {
    inherit username;

    imports = [
      ./homebrew.nix
      ./apps.nix
      ./system.nix
    ];
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      sketchybar-app-font
    ];
  };

  users.users.mixlink = {
    home = "/Users/mixlink";
  };

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '';
}