# Nixcfg

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

## 📖 How to use it?

### 0. Disable SIP

Go to recovery mode and disable SIP as follows:

```bash
csrutils enable --without fs --without debug --without nvram
```

Reboot

```bash
sudo nvram boot-args=-arm64e_preview_abi
```

Reboot again.

Disabling SIP is generally **not recommended**. For more information and alternatives, see: <https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection>

### 1. Nix install

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
```

### 2. Clone repo

```bash
git clone https://github.com/mixL1nk/nixcfg 
```

### 3. Change Hostname

I manage two MacBooks: a MacBook Air and a MacBook Pro.

```bash
# MacBook Air
sudo scutil --set LocalHostName MacBookProM1

# MacBook Pro
sudo scutil --set LocalHostName MacBookAirM3
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

### 4. Update Username

Make sure to update the existing settings with your details.

- flake.nix

```nix
# minxlink to change your name
home-manager.users.mixlink = import ./nix/home/home.nix;
```

- nix/hosts/macbook/configuration.nix

```nix
let
  username = "mixlink"; # change it!
  mkImports = import ../../lib/mkImports.nix args;
in
...
  # change it
  users.users.mixlink = {
    home = "/Users/mixlink";
  };
```

- nix/hosts/macbook/homebrew.nix

```nix
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "mixlink"; # change it
    autoMigrate = true;
  };

```

- nix/home/git.nix

```nix
# change it
userName = "Taeyun Jang";
userEmail = "mixlink@pushpop.ai"; 
```

### 5. Install

```bash
nix run nix-darwin -- switch --flake ~/nixcfg
```

### 6. Manual Setttings

- These applications require Accessibility privileges: `yabai, skhd, borders, sketchbar, Input Source Pro, ChatGPT, Raycast, Ghostty`

- `Karabiner-Elements` requires elevated privileges. I use Complex Modifications, enabled via the Karabiner-Elements UI. For configuration changes, see `nix/home/karabiner.nix`

- Change Raycast shortcut to `cmd + space`

- I use `mise` to manage my development environment. For example, if you need Node.js:

    ```bash
    mise -g use node
    ```

That's it!

## 🛠️ Installed Tools & Packages

Here is a list of installed packages with their descriptions:

## 🍺 Homebrew Packages

### Core Packages

| Package             | Description                                                                 |
|---------------------|------------------------------------------------------------------------------|
| `brew`              | The Homebrew package manager for macOS and Linux. |
| `lua`               | A lightweight, multi-paradigm programming language. |
| `readline`          | A library that provides line-editing and history capabilities for interactive programs with a command-line interface. |
| `switchaudio-osx`   | A command-line utility to switch audio sources on macOS. |
| `nowplaying-cli`    | A command-line tool to display the currently playing music track. |
| `sketchybar`        | A customizable status bar for macOS. |

### Cask Packages

#### Fonts

| Package                 | Description                                                                 |
|-------------------------|------------------------------------------------------------------------------|
| `font-sf-pro`           | Apple's San Francisco Pro font. |
| `font-sf-mono`          | Apple's San Francisco Mono font. |
| `sf-symbols`            | A library of configurable symbols for use in your app's user interface. |
| `font-d2coding`         | A font designed to enhance readability in coding environments, supporting both Korean and English characters. |

#### Browsers

| Package           | Description                                  |
|-------------------|----------------------------------------------|
| `google-chrome`   | A fast, free web browser developed by Google. |

#### Terminal Applications

| Package    | Description                                  |
|------------|----------------------------------------------|
| `ghostty`  | A fast and lightweight terminal emulator. |

#### Productivity Tools

| Package            | Description                                                                 |
|--------------------|------------------------------------------------------------------------------|
| `chatgpt`          | A desktop client for OpenAI's ChatGPT. |
| `notion`           | An all-in-one workspace for notes, tasks, and databases. |
| `obsidian`         | A powerful knowledge base that works on top of a local folder of plain text Markdown files. |
| `proton-mail`      | A secure and encrypted email service. |
| `zoom`             | A video communications platform. |
| `jump`             | A remote desktop application for macOS. |

#### Development Tools

| Package                 | Description                                                                 |
|-------------------------|------------------------------------------------------------------------------|
| `visual-studio-code`    | A source-code editor developed by Microsoft. |
| `cursor`                | An AI-powered code editor. |
| `windsurf`              | A toolkit for web development. |

#### Virtualization

| Package | Description                                  |
|---------|----------------------------------------------|
| `utm`   | A virtual machine host for macOS. |

#### Utilities

| Package               | Description                                                                 |
|-----------------------|------------------------------------------------------------------------------|
| `input-source-pro`    | A tool to manage input sources efficiently on macOS. |
| `karabiner-elements`  | A powerful utility for keyboard customization on macOS. |
| `dropbox`             | A cloud-based file storage and collaboration platform. |
| `raycast`             | A blazingly fast, totally extendable launcher for macOS. |
| `1password`           | A password manager that keeps all your passwords secure behind one password. |
| `1password-cli`       | The command-line interface for 1Password. |

---

## ❄️ Nix Packages

| Package         | Description                                                                 |
|-----------------|------------------------------------------------------------------------------|
| `yabai`         | A tiling window manager for macOS. |
| `skhd`          | A simple hotkey daemon for macOS. |
| `jankyborders`  | A tool to add custom borders to macOS windows. |
| `git`           | A distributed version control system. |
| `yazi`          | A fast terminal file manager. |
| `fzf`           | A general-purpose command-line fuzzy finder. |
| `bat`           | A `cat` clone with syntax highlighting and Git integration. |
| `starship`      | A minimal, blazing-fast, and infinitely customizable prompt for any shell. |
| `zoxide`        | A smarter `cd` command for navigating your filesystem. |
| `lazygit`       | A simple terminal UI for Git commands. |
| `helix`         | A post-modern text editor. |
| `mise`          | A tool to manage development environments. |
| `zellij`        | A terminal workspace with batteries included. |
| `nerd-fonts.jetbrains-mono` | JetBrains Mono Nerd Font |
| `sketchybar-app-font` | Sketchybar Font |
