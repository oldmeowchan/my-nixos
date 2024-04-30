{ pkgs, ... }:

{
  fonts.fontDir.enable = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      hackgen-nf-font
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "hack"  "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
        sansSerif = [ "hack"  "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
        monospace = [ "hack" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];

      };
    };
  };
}
