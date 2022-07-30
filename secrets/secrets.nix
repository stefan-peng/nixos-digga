let
  # set ssh public keys here for your system and user
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMYmWVYhkQS4V5GnJezvhFB/pdkXPfletVPIyONXa9wu root@archie";
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMbZ2dL7vKCsf4JZE/Ly8RW0142fNr0JGYiaKxFx2K9e speng@archie";
  allKeys = [ system user ];
in
{
  "speng-password.age".publicKeys = allKeys;
}
