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
    lsof
    navi
    procs
    ripgrep
    tlrc
    tmux
    usbutils
    zoxide
    inputs.eilmeldung.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
