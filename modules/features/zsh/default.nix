#{
#  inputs,
#  moduleWithSystem,
#  ...
#}: {
#  flake.nixModules.zsh = moduleWithSystem ({
#    pkgs,
#    ...
#  }: {
#    programs.zsh = {
#      enable = true;
#      enableCompletion = true;
#      autosuggestions.enable = true;
#      syntaxHighlighting.enable = true;
#      interactiveShellInit = ''
#        source ${pkgs.zsh-abbr}/share/zsh/zsh-abbr/zsh-abbr.zsh
#      '';
#    };
#  });
#}
