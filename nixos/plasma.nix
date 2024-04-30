{ pkgs,config, ... }:
{
  imports = [
    ./fcitx5/fcitx.nix
  ];
  # Enter keyboard layout
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "altgr-intl";
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    vscode
    microsoft-edge
    firefox
    google-chrome
    parsec-bin
  ];

}
