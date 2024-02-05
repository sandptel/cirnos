let
  username = "end";
  homeDirectory = "/home/end";
in {
  imports = [
    ./ags.nix
    ./anyrun.nix
    ./blackbox.nix
    ./browser.nix
    # ./bspwm.nix
    ./dconf.nix
    ./hyprland.nix
    ./mimelist.nix
    ./packages.nix
    # ./starship.nix
    ./sway.nix
    ./theme.nix
  ];

  home = {
    inherit username homeDirectory;

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      GOPATH = "${homeDirectory}/.local/share/go"; # you can use xdg.cacheHome here
      GOMODCACHE = "${homeDirectory}/.cache/go/pkg/mod"; # "
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  gtk.gtk3.bookmarks = [
    "file://${homeDirectory}/Downloads"
    "file://${homeDirectory}/Documents"
    "file://${homeDirectory}/Pictures"
    "file://${homeDirectory}/Music"
    "file://${homeDirectory}/Videos"
    "file://${homeDirectory}/.config/ags"
    "file://${homeDirectory}/.config/hypr"
    "file://${homeDirectory}/Documents/GitHub"
    "file:///mnt/Windows"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11"; # this must be the version at which you have started using the program
}