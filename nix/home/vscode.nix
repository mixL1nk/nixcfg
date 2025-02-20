{ pkgs, ... }:

{
  programs.vscode = {
    # enable = false;
    # extensions = with pkgs.vscode-extensions; [
    #   editorconfig.editorconfig
    #   usernamehw.errorlens
    #   bbenoist.nix
    #   pkief.material-icon-theme
    #   eamodio.gitlens
    #   esbenp.prettier-vscode
    # ];
    # userSettings = {
    #   "workbench.iconTheme" = "material-icon-theme";
    #   "workbench.startupEditor" = "none";
    #   "workbench.sideBar.location" = "right";
    #   "editor.tabSize" = 4;
    #   "editor.codeActionsOnSave" = {
    #     "source.fixAll" = "explicit";
    #   };
    #   "editor.fontSize" = 16;
    #   "editor.fontFamily" = "'Monaspace Argon', 'Jetbrains Mono' 'monospace', monospace";
    #   "editor.fontLigatures" = "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'";


    #   "terminal.integrated.fontSize" = 14;
    #   "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
      
    #   "nix.enableLanguageServer" = true;
    #   "nix.serverPath" = "nil";
    # };
  };
}