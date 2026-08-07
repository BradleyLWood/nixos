{
  inputs,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

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
    jq
    fastfetch
    usbutils
    lsof
    wget
    git
    gh
    jujutsu
    lazygit
    devenv

    # TODO move to development aspect
    inputs.nvim-bw.packages.${pkgs.stdenv.hostPlatform.system}.default
    #inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.opencode
    #inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.ollama

    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default

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

  #services.libinput = {
  #  enable = true;
  #  touchpad.naturalScrolling = true;
  #};

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.stateVersion = "26.05";
}
