{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.zsh.enable = lib.mkEnableOption "Enable zsh";
  options.features.custom.starship.enable = lib.mkEnableOption "Enable Starship prompt";

  config = lib.mkIf config.features.custom.zsh.enable (lib.mkMerge [
    {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        interactiveShellInit = ''
          source ${pkgs.zsh-abbr}/share/zsh/zsh-abbr/zsh-abbr.zsh
        '';
      };

      programs.yazi = {
        enable = true;
      };

      environment.systemPackages = with pkgs; [
        eza
        fastfetch
        fzf
        lsof
        ripgrep
        tmux
        usbutils
        zoxide
        zsh-abbr
        inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    }

    (lib.mkIf config.features.custom.starship.enable {
      programs.starship = {
        enable = true;
        settings = {
          add_newline = true;
          character = {
            success_symbol = "[->](bold green)";
            error_symbol = "[->](bold red)";
            vimcmd_symbol = "[<-](bold green)";
            vimcmd_visual_symbol = "[<-](bold yellow)";
            vimcmd_replace_symbol = "[<-](bold purple)";
            vimcmd_replace_one_symbol = "[<-](bold purple)";
          };
          format = "$hostname$directory$line_break$character";
          right_format = " $git_branch$git_commit$git_state$git_metrics$git_status";
          hostname = {
            ssh_only = true;
            format = "[$hostname](bold green) ";
            disabled = false;
          };
        };
      };
    })
  ]);
}
