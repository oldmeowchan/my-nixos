{ pkgs, ... }:
{

  i18n.inputMethod = {
    enabled = "fcitx5";
    #fcitx5.waylandFrontend =true;
    fcitx5.addons = with pkgs; [ fcitx5-with-addons fcitx5-chinese-addons fcitx5-gtk ];
  };


}
