_:

{
  home.file.".ssh/allowed_signers".text =
    "* ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgzXEZv40rgP1OUIMopKDqNFImKcIExA3pC45b7R2VS";

  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host *
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };
}