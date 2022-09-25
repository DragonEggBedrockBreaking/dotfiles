{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "username";
  home.homeDirectory = "/home/username";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    bat
    bleachbit
    bottom
    cargo
    catdoc
    delta
    djvulibre
    du-dust
    exa
    fantasque-sans-mono
    fd
    feh
    ffmpeg
    ffmpegthumbnailer
    fontpreview
    fzf
    gcc
    git
    glxinfo
    gnome.gnome-tweaks
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnupg
    helix
    jetbrains.idea-community
    keepassxc
    librewolf
    lshw
    melody
    meson
    mold
    ncdu
    neofetch
    neovim
    nim
    ninja
    nodePackages.fixjson
    nushell
    p7zip
    pandoc
    poppler
    procs
    python310
    python310Packages.pip
    ripgrep
    rustc
    rustfmt
    solaar
    starship
    tealdeer
    tokei
    unzip
    vifm
    vscode
    wezterm
    wget
    xorg.xkill
    youtube-dl
    zig
    zip
    zoxide
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
