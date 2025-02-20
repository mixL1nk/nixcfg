{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gh
  ];

 programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "Taeyun Jang";
    userEmail = "mixlink@pushpop.ai";

    ignores = [
      ".idea" ".vs" ".vsc" ".vscode"
      "node_modules" "npm-debug.log"
      "__pycache__" "*.pyc"
      ".ipynb_checkpoints" "__sapper__" ".DS_Store"
    ];

    signing = {
      format = "ssh";
      signer = lib.mkForce "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    };

    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgzXEZv40rgP1OUIMopKDqNFImKcIExA3pC45b7R2VS";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";

      commit.gpgSign = true;
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;

    };
  };
}