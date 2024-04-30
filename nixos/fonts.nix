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
        serif = [ "Hack" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
        sansSerif = [ "Hack" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
        monospace = [ "Hack" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
			};
			        localConf = ''
          <match target="font">
          	<!-- 开启抗锯齿(smooth) -->
          	<edit name="antialias"><bool>true</bool></edit>

          	<!-- 优先使用内嵌微调，同时默认开足微调 -->
          	<edit name="hinting"><bool>true</bool></edit>
          	<edit name="autohint"><bool>false</bool></edit>
          	<!-- 依个人喜好,你也可能喜欢默认"hintslight"(此时可将下面的"第七步"全部注释掉) -->
          	

          	<!-- LCD特征设置 -->
          	<edit name="rgba"><const>rgb</const></edit>
          	<edit name="lcdfilter"><const>lcddefault</const></edit>


          </match>
        '';
    };
  };
}
