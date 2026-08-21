{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.zsh.enable = lib.mkEnableOption "Enable zsh";
  config = lib.mkIf config.features.custom.zsh.enable {
    # Catppuccin Mocha console colors — applies to ALL TTYs system-wide
    console.colors = [
      "1e1e2e" # 0  black
      "f38ba8" # 1  red
      "a6e3a1" # 2  green
      "f9e2af" # 3  yellow
      "89b4fa" # 4  blue
      "f5c2e7" # 5  magenta
      "94e2d5" # 6  cyan
      "bac2de" # 7  white
      "585b70" # 8  bright black
      "f38ba8" # 9  bright red
      "a6e3a1" # 10 bright green
      "f9e2af" # 11 bright yellow
      "89b4fa" # 12 bright blue
      "f5c2e7" # 13 bright magenta
      "94e2d5" # 14 bright cyan
      "a6adc8" # 15 bright white
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      interactiveShellInit = ''
        source ${pkgs.zsh-abbr}/share/zsh/zsh-abbr/zsh-abbr.zsh
      '';
    };

    environment.systemPackages = with pkgs; [
      zsh-abbr
    ];
  };
}
