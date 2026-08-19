{
  imports = [
    ./features/calibre.nix
    ./features/desktop.nix
    ./features/devtools.nix
    ./features/gnome.nix
    ./features/helix.nix
    ./features/hyprland.nix
    ./features/obsidian.nix
    ./features/starship.nix
    ./features/terminal.nix
    ./features/xdg.nix
    ./features/yazi.nix
    ./features/zellij.nix

    ./services/keyd.nix
    ./services/fwupd.nix
    ./services/greetd.nix
    ./services/sddm.nix
    ./services/ssh.nix

    ./system/audio.nix
    ./system/base.nix
    ./system/networking.nix
    ./system/utils.nix
    ./system/desktoputils.nix
  ];
}
