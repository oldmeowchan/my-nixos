{pkgs,...}:
{
i18n.inputMethod.enabled ="fcitx5";

i18n.inputMethod.fcitx5.addons= with pkgs; [ qt6Packages.fcitx5-chinese-addons  fcitx5-gtk ];

}