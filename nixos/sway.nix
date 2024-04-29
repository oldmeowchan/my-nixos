{pkgs,...}:
{
  programs.sway = {
  enable = true;
  wrapperFeatures.gtk = true;
  };

  environment.systemPackages = with pkgs; [ 
	  vscode 
	  microsoft-edge
	  firefox
    kitty
  ];


}