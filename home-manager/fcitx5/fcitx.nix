{pkgs,...}:
{
  i18n.inputMethod = {
    enabled = "fcitx5";
    waylandFrontend =true;

    plasma6Support = true;
    fcitx5.addons = with pkgs; [
         #fcitx5-rime
        #fcitx5-chinese-addons
    ];
  };

}