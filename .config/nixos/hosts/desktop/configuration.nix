# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.kolourpaint
    gparted
    brave
    vlc
    ungoogled-chromium
    telegram-desktop
    zulip
    obsidian
    vscode.fhs
    libimobiledevice
    kitty
    wget
    gcc
    ripgrep
    nodejs_20
    unzip
    man-pages
    htop
    git
    vim
    unzip
    rmtrash
    go
    eza
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.direnv.enable = true;
  programs.fish.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
     settings = {
       default-cache-ttl = 28800;
       max-cache-ttl = 28800;
     };
  };

  # Needed for many programs even on waylan for som reason
  services.xserver.enable = true;
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/mnt/win" =
    { device = "/dev/nvme0n1p5";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000"];
    };

  networking.hostName = "desktop-nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # should be bettern, but still buggy
  # networking.networkmanager.wifi.backend = "iwd";

  services.dbus.implementation = "broker";
  services.fstrim.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  hardware.bluetooth.enable = true;
  hardware.enableAllFirmware = true;

  # https://nixos.wiki/wiki/IOS
  services.usbmuxd.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ez = {
    isNormalUser = true;
    description = "ez";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [
    ];
  };
  time.timeZone = "Europe/Belgrade";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "hu";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "hu";

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
