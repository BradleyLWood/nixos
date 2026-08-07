{
  imports = [
    ./services/keyd.nix
    ./services/sddm.nix
    ./services/ssh.nix

    ./system/audio.nix
    ./system/base.nix
    ./system/boot.nix
    ./system/networking.nix

    ./features/gnome.nix
    ./features/hyprland.nix
    ./features/terminal.nix
    ./features/xdg.nix
  ];
}
