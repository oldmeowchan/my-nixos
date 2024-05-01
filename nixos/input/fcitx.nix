{ pkgs, ... }:
{

  i18n.inputMethod = {
    enabled = "fcitx5";
    #fcitx5.waylandFrontend =true;
    fcitx5.addons = with pkgs; [ kdePackages.fcitx5-with-addons qt6Packages.fcitx5-chinese-addons fcitx5-gtk ];
  };


}
