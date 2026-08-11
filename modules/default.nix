{
  imports = [
    ./features/desktop.nix
    ./features/devtools.nix
    ./features/gnome.nix
    ./features/hyprland.nix
    ./features/starship.nix
    ./features/terminal.nix
    ./features/xdg.nix
    ./features/yazi.nix

    ./services/keyd.nix
    ./services/sddm.nix
    ./services/ssh.nix

    ./system/audio.nix
    ./system/base.nix
    ./system/networking.nix
    ./system/utils.nix
  ];
}
