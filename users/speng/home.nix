{ config, pkgs, ... }@inputs:
let
  stdenv = pkgs.stdenv;
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "speng";
  home.homeDirectory = "/home/speng";

  # TODO: overlay to add packages to pkgs

  # user session environment
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    TERMINAL = "${pkgs.alacritty}/bin/alacritty";
  };

  home.packages = [
    pkgs.nixfmt
    # replace with custom editor package
    # lorri daemon setup in system config
    pkgs.lorri
    # knowledge management tool
    # pkgs.nb
    #

    pkgs.bat
    pkgs.ranger

    # pkgs.zathura.withPlugins (plugins: {
    #   plugins = [];
    # })
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # home.stateVersion = "21.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg.enable = true;

  programs.lsd.enable = true;
  programs.lsd.enableAliases = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;
    loginShellInit = ''
      # log into default tmux session
      if not set -q TMUX
        # tmux new -t login -A -s login\;\
        tmux neww -t login:agenda -s -n agenda vim $AGENDA
      end
    '';
  };

  # user session services
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  # other managed files
  home.file.i3exit = {
    source = ./. + "/i3/i3exit.sh";
    target = "bin/i3exit";
    executable = true;
  };
  # windows manager configured in system profile, but config managed here in user profile
  # TODO: should graphical session and WM be configured here or through system conf?
  xdg.configFile."i3/config" = {
    source = ./. + "/i3/config";
  };
  # xsession.windowManager.i3 = {
  #   enable = true;
  #   extraConfig = (builtins.readFile (configRoot + "/i3/.config/i3/config"));
  # };
}
