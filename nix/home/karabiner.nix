{ ... }: 
let disable = from: {
  type = "basic";
  from = from;
};
  swap = from: to: {
    type = "basic";
    from = {
      key_code = from;
      modifiers = { optional = [ "any" ]; };
    };
    to = [{ key_code = to; }];
    conditions = [ ];
  };
in {home.file.karabiner = {
  target = ".config/karabiner/assets/complex_modifications/nix.json";
  text = builtins.toJSON {
    title = "Nix Managed";
    rules = [{
      description = "Modifications managed by Nix";
      manipulators = [
        # disable command+h, command+option+m
        ( 
          disable { key_code = "h"; modifiers = { mandatory = ["command"]; optional = [ "any" ]; };}
        )
        # disable command+option+h
        ( 
          disable { key_code = "h"; modifiers = { mandatory = ["command" "option"]; optional = [ "any" ]; };}
        )
        # disable command+option+m
        ( 
          disable { key_code = "m"; modifiers = { mandatory = ["command" "option"]; optional = [ "any" ]; };}
        )
        ( 
          disable { key_code = "m"; modifiers = { mandatory = ["command"]; optional = [ "any" ]; };}
        )
        # right command to f18
        (swap "right_command" "f18")
        # Tap Caps Lock for ESC or Hold for Control
        (
         {
          type= "basic";
          from= { key_code= "caps_lock"; modifiers= { optional = ["any"]; };};
          to=[{key_code= "left_control"; lazy=true; }];
          to_if_alone=[{ key_code="escape"; }];
         }
        )
      ];
    }];
  };
  };
}
