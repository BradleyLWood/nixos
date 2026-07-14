{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "paconix"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users."bradley" = {
    isNormalUser = true;
    description = "Bradley Wood";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "vim";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch -I nixos-config=$HOME/.nixconfig/configuration.nix";
      config = "${lib.getExe pkgs.git} --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
    };

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];

    interactiveShellInit = ''
      export KEYTIMEOUT=1
      bindkey -v
      bindkey '^L' 'autosuggest-accept'
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
        vimcmd_symbol = "[<](bold green)";
        vimcmd_visual_symbol = "[<](bold yellow)";
        vimcmd_replace_symbol = "[<](bold purple)";
        vimcmd_replace_one_symbol = "[<](bold purple)";
      };
    };
  };

  programs.tmux = {
    enable = true;
    escapeTime = 0;
    clock24 = false;
    extraConfig = ''
      set -g base-index 1
      set -g pane-base-index 1
      
      set -g set-titles on
      set -g set-titles-string '#{session_name} • #{window_index} • #{pane_title}'
      set -g automatic-rename on
      set -g automatic-rename-format '#{b:pane_current_path}'
      
      set -g default-terminal "screen-256color"
      set -g default-shell ${pkgs.zsh}/bin/zsh
      set -g default-command ${pkgs.zsh}/bin/zsh
      set -ga terminal-overrides ",xterm-256color:Tc"

      set -g detach-on-destroy off

      set-window-option -g mode-keys vi
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
      bind p paste-buffer

      unbind C-b
      set -g prefix C-space
      bind space send-prefix

      set-window-option -g mode-keys vi
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
      bind p paste-buffer

      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

      bind -r h previous-window
      bind -r j switch-client -n
      bind -r k switch-client -p
      bind -r l next-window
      bind -r C-h select-pane -L
      bind -r C-j select-pane -D
      bind -r C-k select-pane -U
      bind -r C-l select-pane -R
      bind -r M-h resize-pane -L 5
      bind -r M-j resize-pane -D 5
      bind -r M-k resize-pane -U 5
      bind -r M-l resize-pane -R 5

      unbind s
      unbind v
      bind s split-window -h -c "#(pane_current_path)"
      bind v split-window -v -c "#(pane_current_path)"

      bind -r C-Left swap-window -t -1 \; select-window -t -1
      bind -r C-Right swap-window -t +1 \; select-window -t +1

      set -g status-position top

      set -g status-left-length 100
      set -g status-left "#[fg=blue,bg=#1e1e2e]  #[fg=#1e1e2e,bg=blue] #h │ #S #[fg=blue,bg=#1e1e2e]"
      set -g status-left-style "bg=blue,fg=black"

      set -g status-justify centre
      set -g status-style "bg=default"
      setw -g window-status-current-format '#[bold]#[fg=#cba6f7,bg=#1e1e2e]█#[fg=black,bg=#cba6f7]#I #W#[fg=#cba6f7,bg=#1e1e2e]█'
      setw -g window-status-format ' #I #W '
      setw -g window-status-separator ' '
      setw -g window-status-style "bg=#1e1e2e"
      setw -g window-status-current-style "bg=#cba6f7,fg=black"

      set -g status-right-length 100
      set -g status-right "#[fg=blue, bg=default] #[fg=black, bg=blue] %m/%d │ %I:%M %p #[fg=blue, bg=default]  "
      set -g status-right-style "bg=default,fg=blue"
    '';
  };

  programs.waybar = {
    enable = true;
  };
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    kitty
    ghostty
    #neovim
    #lua-language-server
    ripgrep
    gcc
    git
    gh
    wget
    google-chrome
    wofi
    pkgs.nerd-fonts.fira-code
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.openssh ={
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
      AllowUsers = [ "bradley" ];
      MaxAuthTries = 3;
    };
    ports = [ 2270 ];
  };

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "escape";
          escape = "capslock";
        };
      };
    };
  };

  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
