{ ... }:
let
  defManipulator = { type = "basic"; conditions = [ ]; };

  disable = from:
    defManipulator // {
      from = from;
    };

  swap = from: to:
    defManipulator // {
      from = {
        key_code = from;
        modifiers = { optional = [ "any" ]; };
      };
      to = [{ key_code = to; }];
    };

  tapHold = tap: hold: alone: 
    defManipulator // {
      from = { key_code = tap; modifiers = { optional = [ "any" ]; }; };
      to = [{ key_code = hold; lazy = true; }];
      to_if_alone = [{ key_code = alone; }]; 
    };
in {
  home.file.karabiner = {
    target = ".config/karabiner/assets/complex_modifications/nix.json";
    text = builtins.toJSON {
      title = "Nix Managed";
      rules = [{
        description = "Modifications managed by Nix";
        manipulators = [
          # Disable command+h and command+option+m (combined)
          (disable { key_code = "h"; modifiers = { mandatory = ["command"]; optional = [ "any" ]; }; })
          (disable { key_code = "m"; modifiers = { mandatory = ["command" "option"]; optional = [ "any" ]; }; })
          (disable { key_code = "m"; modifiers = { mandatory = ["command"]; optional = [ "any" ]; }; })

          # Right command to f18
          (swap "right_command" "f18")

          # Tap Caps Lock for ESC or Hold for Control
          (tapHold "caps_lock" "left_control" "escape")
        ];
      }];
    };
  };
}