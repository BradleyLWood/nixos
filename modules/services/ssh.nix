{
  config,
  lib,
  ...
}: {
  options.services.custom.ssh.enable = lib.mkEnableOption "SSH server with hardened defaults";
  config = lib.mkIf config.services.custom.ssh.enable {
    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
        AllowUsers = ["bradley"];
      };
      ports = [2270];
    };
  };
}
