{inputs, ...}: {
  flake.modules.nixos.base = {
    config,
    pkgs,
    ...
  }: {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      EDITOR = "vim";
    };

    # To search, run: $ nix search <package-name>
    environment.systemPackages = with pkgs; [
      vim
      tmux
      eza
      fzf
      zoxide
      ripgrep
      fastfetch
      wget
      git
      gh
      lazygit

      # TODO move to development aspect
      inputs.nvim.packages.${pkgs.system}.default
      inputs.self.packages.${pkgs.system}.opencode
      inputs.self.packages.${pkgs.system}.ollama

      inputs.herdr.packages.${pkgs.system}.default

      # TODO move these into other aspect sets
      zsh-abbr
      kitty
      ghostty
      #gcc
      google-chrome
      wofi
      brightnessctl
      hypridle
      hyprlock
      wlogout
    ];

    # Enable OpenGL
    hardware.graphics = {
      enable = true;
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      # Modesetting is required for most modern Wayland compositors (e.g., Hyprland, GNOME)
      modesetting.enable = true;

      # Nvidia power management. Required for suspend/resume.
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;

      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };

    # set in lib.mkHost
    #networking.hostName = "paconix"; # Define your hostname.
    networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

    networking.networkmanager.enable = true;

    # TODO move to desktop flake
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    users.users."bradley" = {
      isNormalUser = true;
      description = "Bradley Wood";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.zsh;
      # TODO add git user info
    };

    users.users."eliana" = {
      isNormalUser = true;
      description = "Eliana Wood";
      extraGroups = ["networkmanager"];
      shell = pkgs.zsh;
    };

    #programs.zellij = {
    #  enable = true;
    #  settings = {
    #    theme = "catppuccin-mocha";
    #  };
    #};

    programs.yazi = {
      enable = true;
    };

    programs.git = {
      enable = true;
      config = {
        credential = {
          "https://github.com" = {
            helper = "!${pkgs.github-cli}/bin/gh auth git-credential";
          };
        };
      };
    };

    # TODO move to desktop flake
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # TODO move to desktop flake
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    # TODO move to desktop flake
    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      interactiveShellInit = ''
        source ${pkgs.zsh-abbr}/share/zsh/zsh-abbr/zsh-abbr.zsh
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
        format = "$directory$line_break$character";
        right_format = " $git_branch$git_commit$git_state$git_metrics$git_status";
      };
    };

    programs.waybar = {
      enable = true;
    };

    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    programs.mtr.enable = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
        AllowUsers = ["bradley"];
        MaxAuthTries = 3;
      };
      ports = [2270];
    };

    services.keyd = {
      enable = true;
      keyboards.default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "escape";
            escape = "capslock";
          };
        };
      };
    };

    services.libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    system.stateVersion = "26.05";
  };
}
