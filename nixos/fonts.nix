{ pkgs, ... }:

{
  fonts.fontDir.enable = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts
			dejavu_fonts
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
        serif = [ "Noto Serif"  "Source Han Serif SC VF" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
        sansSerif = [  "Noto Sans"  "Source Han Sans TC VF" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
        monospace = [ "Noto Sans Mono"  "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" ];
      };

      #antialias = true;

      #hinting.enable = true;
      #hinting.style = "full";
      #hinting.autohint = false;

      #subpixel.rgba = "rgb";
      #subpixel.lcdfilter = "default";

      #useEmbeddedBitmaps = false;

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

        	<!-- 开启抗锯齿(smooth) -->
        	<edit name="antialias"><bool>true</bool></edit>

        	<!-- 优先使用内嵌微调，同时默认开足微调 -->
        	<edit name="hinting"><bool>true</bool></edit>
        	<edit name="autohint"><bool>false</bool></edit>
        	<!-- 依个人喜好,你也可能喜欢默认"hintslight"(此时可将下面的"第七步"全部注释掉) -->
        	<edit name="hintstyle"><const>hintfull</const></edit>

        	<!-- LCD特征设置 -->
        	<edit name="rgba"><const>rgb</const></edit>
        	<edit name="lcdfilter"><const>lcddefault</const></edit>

        	<!-- 禁用内嵌点阵 -->
        	<edit name="embeddedbitmap"><bool>false</bool></edit>

        	<!-- 禁用合成粗体 -->
        	<edit name="embolden"><bool>false</bool></edit>
        </match>
      '';
    };
  };
}
