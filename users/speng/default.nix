{ self, hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) speng; };
  age.secrets.speng-password.file = "${self}/secrets/speng-password.age";

  users.users.speng =
    let
      passwordFile = "/run/agenix/speng-password";
    in
    {
      #password = "nixos";
      passwordFile = passwordFile;
      description = "default";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
}
