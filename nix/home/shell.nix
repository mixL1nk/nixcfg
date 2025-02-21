{ pkgs, config, ... }:

{
  programs = {
    # let home-manager manage itself
    home-manager.enable = true;
    # file manager
    yazi.enable = true;

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    
    starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = false;

        character = {
          error_symbol = "[➜](bold red)";
          success_symbol = "[➜](bold green)";
        };
      };
    };

    bat = {
      enable = true;
      config = {theme = "tokyonight";};
      themes = {
        tokyonight = {
          src =
            pkgs.fetchFromGitHub
            {
              owner = "folke";
              repo = "tokyonight.nvim";
              rev = "b262293ef481b0d1f7a14c708ea7ca649672e200";
              sha256 = "sha256-pMzk1gRQFA76BCnIEGBRjJ0bQ4YOf3qecaU6Fl/nqLE=";
            };
          file = "extras/sublime/tokyonight_night.tmTheme";
        };
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    lazygit = {
      enable = true;
      settings = {
        git = {
          paging = {
            colorArg = "always";
            pager = "delta --color-only --dark --paging=never";
            useConfig = false;
          };
        };
      };
    };

    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "onedark";
        editor = {
          line-number = "relative";
          end-of-line-diagnostics = "hint";
          inline-diagnostics = {
            cursor-line = "warning";
          };
          cursorline = true;
          mouse = false;
          lsp.display-messages = true;
        };
      };
    };

    mise = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        history = {
          expireDuplicatesFirst = true;
          ignoreSpace = false;
          save = 15000;
          share = true;
        };
        initExtra = ''

        '';
        shellAliases = {
          cat = "bat";
          lg = "lazygit";
          
          ls = "eza --icons  -T -L 1 -x";
          ll = "eza --icons  -T -L 2 -x";
          la = "eza -a --icons -x -T -L 1 -x";
          
          cd = "z";
          ".." = "cd ..";
          "..." = "cd ../../";
        };
      };
  };
}