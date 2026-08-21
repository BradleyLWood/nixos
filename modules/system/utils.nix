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
    lsof
    navi
    ripgrep
    tlrc
    tmux
    usbutils
    zoxide
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
