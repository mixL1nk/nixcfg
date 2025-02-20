{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, flake-utils, nixpkgs, rust-overlay, nix-darwin, ... }:
  let
    overlays = [ (import rust-overlay) ];
    nixpkgsConfig = {
      inherit overlays;
      config.allowUnfree = true;
      
    };
    # 공통 모듈 정의
  commonModules = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.home-manager.darwinModules.home-manager
    ./nix/hosts/macbook/configuration.nix  # 모든 MacBook이 공통적으로 사용
    {
      nixpkgs = nixpkgsConfig;
      nix.enable = false;
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.mixlink = import ./nix/home/home.nix;
    }
  ];
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBookPro
    darwinConfigurations = {
      "MacBookProM1" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = commonModules;
      };

      "MacBookAirM3" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = commonModules;
      };
    };
  };
}
