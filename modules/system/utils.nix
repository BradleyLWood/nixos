{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    eza
    fastfetch
    fzf
    lsof
    ripgrep
    tmux
    usbutils
    zoxide
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
