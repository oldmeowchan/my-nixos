{ pkgs, config, ... }:
{
  imports = [
    #./fcitx5/fcitx.nix
  ];
  # Enter keyboard layout
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "altgr-intl";
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.xwayland.enable = true;
  services.flatpak.enable = true;
  #i18n.inputMethod.fcitx5.plasma6Support ;
  programs.dconf.enable = true;
  #services.desktopManager.plasma6.notoPackage = pkgs.noto-fonts;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    vscode
    microsoft-edge
    firefox
    google-chrome
    parsec-bin
    godot_4
    kdePackages.discover
    qq
    isoimagewriter
    vlc
  ];

}
