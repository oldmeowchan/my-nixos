{pkgs,...}:
{
i18n.inputMethod.enabled ="fcitx5";
#config.services.desktopManager.plasma6.enable = true;
#i18n.inputMethod.fcitx5.plasma6Support = true;
i18n.inputMethod.fcitx5.addons= with pkgs; [ fcitx5-rime fcitx5-chinese-addons];

}