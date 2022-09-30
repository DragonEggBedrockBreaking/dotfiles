{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "username";
  home.homeDirectory = "/home/username";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    afetch
    bat
    bleachbit
    bottom
    cargo
    catdoc
    clang
    clang-tools
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
    git
    glxinfo
    gnome.gnome-tweaks
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnupg
    jdk
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
    nodejs
    nodePackages.fixjson
    nodePackages.pnpm
    nushell
    p7zip
    pandoc
    poppler
    procs
    pypy3
    python310
    python310Packages.pip
    ripgrep
    rust-analyzer
    rustc
    rustfmt
    solaar
    starship
    tealdeer
    tokei
    vifm
    wezterm
    wget
    xorg.xkill
    youtube-dl
    zig
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
}
