{ pkgs, lib, ... } : {

  #  home.activation.sketchybar = lib.hm.dag.entryAfter ["writeBoundary"] "${pkgs.sketchybar}/bin/sketchybar --reload";
  home.activation.sbarlua = lib.hm.dag.entryAfter ["sketchybar"] ''
    export PATH=${pkgs.coreutils}/bin:/usr/bin:$PATH
    export CFLAGS="-I/usr/local/opt/readline/include -I/usr/local/opt/readline/include/readline"
    export LDFLAGS="-L/usr/local/opt/readline/lib"
    if [ ! -d "/tmp/SbarLua" ]; then
      git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua
      cd /tmp/SbarLua
      make install 
      rm -rf /tmp/SbarLua
    fi
    if [ ! -d "/tmp/dotfiles" ]; then
      git clone https://github.com/FelixKratz/dotfiles.git /tmp/dotfiles
      if [ !-d "$HOME/.config/sketchybar"]; then
        mv /tmp/dotfiles/.config/sketchybar $HOME/.config/sketchybar
      fi
      rm -rf /tmp/dotfiles
    fi
  '';
    
}