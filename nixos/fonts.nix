{ pkgs, ... }:

{
  fonts.fontDir.enable = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts
      source-han-sans-vf-otf
      source-han-serif-vf-otf
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
        serif = [ "DejaVu Serif" "Hack" "Source Han Serif SC VF" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
        sansSerif = [ "DejaVu Sans" "Hack" "Source Han Sans TC VF" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
        monospace = [ "DejaVu Sans Mono" "Hack" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
      };

      antialias = true;

      hinting.enable = true;
      hinting.style = "full";
      hinting.autohint = false;

      subpixel.rgba = "rgb";
      subpixel.lcdfilter = "default";

      useEmbeddedBitmaps = false;

      localConf = ''
        					        <match target="font">
                	<!-- 修整像素大小(小于10px的调整到10px，否则四舍五入到整数) -->
                	<edit name="pixelsize">
                		<if>
                			<less>
                				<name>pixelsize</name>
                				<double>10</double>
                			</less>
                			<int>10</int>
                			<round>
                				<name>pixelsize</name>
                			</round>
                		</if>
                	</edit>
                	<!-- 禁用合成粗体 -->
                	<edit name="embolden"><bool>false</bool></edit>
                </match>
      '';
    };
  };
}
