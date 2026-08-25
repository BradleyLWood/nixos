{pkgs, ...}: {
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

  i18n.inputMethod = {
    enable = false;
    type = null;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "vim";
  };

  # To search, run: $ nix search <package-name>
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
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
    linger = true; # for background  timers/services
  };

  users.users."eliana" = {
    isNormalUser = true;
    description = "Eliana Wood";
    extraGroups = ["networkmanager"];
    shell = pkgs.zsh;
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.stateVersion = "26.05";
}
