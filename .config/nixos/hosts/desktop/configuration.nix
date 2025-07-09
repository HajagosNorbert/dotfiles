# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

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
    qbittorrent
    anki-bin
    ungoogled-chromium
    obsidian
    vscode.fhs
    zed-editor
    libimobiledevice
    kitty
    ghostty
    wget
    ripgrep
    nodejs_22
    unzip
    man-pages
    steam-run
    htop
    git
    vim
    unzip
    rmtrash
    go
    cbqn-standalone-replxx
    hugo
    rustup
    uiua-unstable
    eza
    wl-clipboard
    inputs.bqnlsp.packages.${pkgs.system}.lsp
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    acl
    attr
    bzip2
    dbus
    expat
    fontconfig
    freetype
    fuse3
    icu
    libnotify
    libsodium
    libssh
    libunwind
    libusb1
    libuuid
    nspr
    nss
    stdenv.cc.cc
    util-linux
    zlib
    zstd
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
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
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
  systemd.extraConfig = ''DefaultTimeoutStopSec=10s'';
  systemd.user.extraConfig = "DefaultTimeoutStopSec=10s";

  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/mnt/win" =
    { device = "/dev/nvme0n1p5";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000"];
    };

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];

  networking.hostName = "desktop-nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # should be bettern, but still buggy
  # networking.networkmanager.wifi.backend = "iwd";

  services.dbus.implementation = "broker";
  services.fstrim.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [
    pkgs.gutenprint
    pkgs.gutenprintBin
    pkgs.cnijfilter2
    pkgs.canon-capt
  ];

  hardware.bluetooth.enable = true;
  hardware.enableAllFirmware = true;

  # https://nixos.wiki/wiki/IOS
  services.usbmuxd.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
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
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
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
