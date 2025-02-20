# Nixcfg

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

# How to use it?
## 0. Disable SIP

Go to recovery mode and disable SIP as follows:
```bash
csrutils enable --without fs --without debug --without nvram
```
Reboot

```bash
sudo nvram boot-args=-arm64e_preview_abi
```
Reboot again.

Disabling SIP is generally **not recommended**. For more information and alternatives, see: https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

## 1. Nix install
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
```

## 2. Clone repo
```
git clone https://github.com/mixL1nk/nixcfg 
```
## 3. Change Hostname

I manage two MacBooks: a MacBook Air and a MacBook Pro.

```bash
# MacBook Air
sudo scutil --set LocalHostName MacBookProM1

# MacBook Pro
sudo scutil --set LocalHostName MacBookAirM3
if you want to change this, see `flake.nix`
```

To change these hostnames, see `flake.nix`.
```Nix
# Change the names below as desired.
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
```

## 4. Install
```bash
nix run nix-darwin -- switch --flake ~/nixcfg
```

## 5. Manual Setttings
- These applications require Accessibility privileges: `yabai, skhd, borders, sketchbar, Input Source Pro, ChatGPT, Raycast, Ghostty`

- `Karabiner-Elements` requires elevated privileges. I use Complex Modifications, enabled via the Karabiner-Elements UI. For configuration changes, see `nix/home/karabiner.nix`

- Change Raycast shortcut to `cmd + space`

- I use `mise` to manage my development environment. For example, if you need Node.js:
    ```bash
    mise -g use node
    ```
That's it!

