{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) speng; };

  users.users.speng = {
    password = "nixos";
    description = "default";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
