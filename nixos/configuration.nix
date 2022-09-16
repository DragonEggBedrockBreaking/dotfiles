{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-6db9342a-8566-4fa4-8801-cf7f185115f3".device = "/dev/disk/by-uuid/6db9342a-8566-4fa4-8801-cf7f185115f3";
  boot.initrd.luks.devices."luks-6db9342a-8566-4fa4-8801-cf7f185115f3".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.username = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };

  # Disable optional GNOME software
  environment.gnome.excludePackages = (with pkgs; [
    baobab
    celluloid
    epiphany
    gnome-connections
    gnome-console
    gnome-photos
  ]) ++ (with pkgs.gnome; [
    cheese
    eog
    evince
    file-roller
    geary
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-disk-utility
    gnome-font-viewer
    gnome-keyring
    gnome-logs
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-weather
    nautilus
    seahorse
    simple-scan
    totem
  ]);

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Kernel version
  boot.kernelPackages = pkgs.linuxPackages_5_19;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05";
}
