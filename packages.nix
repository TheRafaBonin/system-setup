{ config, pkgs, ... }:

{ 
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Basic sofware
    vim
    git
    wget
    tmux
    lshw
    htop
    killall
    pciutils
    
    # Clipbord manager
    wl-clipboard
    cliphist

    # File Manager
    pcmanfm

    # Sound
    pipewire
    wireplumber
    pavucontrol

    # QT Wayland Support
    libsForQt5.qt5.qtwayland
    qt6.qtwayland

    # Notification
    dunst                # Notification daemon
    libnotify            # Notification daemon depends on it
   
    # Wayland and display
    waybar               # Sistem bar
    pywal                # Theme color generator
    hyprpaper            # Wallpaper daemon-fallback
    wpaperd              # Wallpaper daemon
    kitty                # Terminal emulator
    wlogout              # Logout menu
    rofi-wayland         # App launcher
    swaylock             # Screen locker
    networkmanagerapplet # Networkmanager applet
   
    # Screenshot tools
    grim
    slurp
    swappy
    
    # Tweaks waybar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    ) 
  ];
}
