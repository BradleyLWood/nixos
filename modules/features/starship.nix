{
  lib,
  config,
  pkgs,
  ...
}: {
  options.features.custom.starship.enable = lib.mkEnableOption "Enable starship";
  config = lib.mkIf config.features.custom.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[⟩](bold green)";
          error_symbol = "[⟩](bold red)";
          vimcmd_symbol = "[⟨](bold green)";
          vimcmd_visual_symbol = "[⟨](bold yellow)";
          vimcmd_replace_symbol = "[⟨](bold purple)";
          vimcmd_replace_one_symbol = "[⟨](bold purple)";
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
  };
}
