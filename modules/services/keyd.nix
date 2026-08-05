{
  config,
  lib,
  ...
}: {
  options.services.custom.keyd.enable = lib.mkEnableOption "keyd daemon for swapping escape and capslock keys";
  config = lib.mkIf config.services.custom.keyd.enable {
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
  };
}
