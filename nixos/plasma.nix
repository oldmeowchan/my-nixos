{  pkgs, ... }:
{
  imports = [
  ];
  # Enter keyboard layout
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "altgr-intl";
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable =true;
  #services.desktopManager.plasma6.enable = true;

  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [ 
	vscode 
	microsoft-edge
	firefox
  #fcitx5
  #kdePackages.fcitx5-with-addons
  #kdePackages.fcitx5-chinese-addons
  #fcitx5-rime
  clash-geoip
  ];

}