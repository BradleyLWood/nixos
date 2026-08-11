{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.zsh.enable = lib.mkEnableOption "Enable zsh";
  config = lib.mkIf config.features.custom.zsh.enable {
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
