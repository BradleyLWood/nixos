{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bat
    btop
    eza
    fastfetch
    fzf
    libnotify
    libva-utils
    lsof
    mesa-demos
    navi
    procs
    ripgrep
    tlrc
    tmux
    usbutils
    vulkan-tools
    zoxide
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
