{
  description = "";
  inputs = {

    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixoswsl.url = "github:nix-community/NixOS-WSL/main";
nixoswsl.inputs.nixpkgs.follows = "nixpkgs";
nixos-wsl-vscode.url = "github:Atry/nixos-wsl-vscode";
vscode-server.url = "github:nix-community/nixos-vscode-server";


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };


    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    flake-utils.follows = "nix-vscode-extensions/flake-utils";
    nixpkgs.follows = "nix-vscode-extensions/nixpkgs";

    nur.url = "github:nix-community/NUR";
  };
  outputs =
    { self
    , nixpkgs
    , home-manager
    , plasma-manager
    ,nixoswsl
    ,nixos-wsl-vscode
	,vscode-server
    , ...
    } @ inputs:
    let

      inherit (self) outputs;
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # FIXME replace with your hostname
        libvirt = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
            ./nixos/basic.nix
            ./nixos/fonts.nix
            ./nixos/plasma.nix
            ./nixos/vscode_patch.nix
            ./hosts/libvirt/configuration.nix

          ];
        };

        mainpc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
            ./nixos/basic.nix
            ./nixos/fonts.nix
            ./nixos/plasma.nix
            ./nixos/vt.nix
            ./hosts/mainpc/config.nix

          ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
        nixoswsl.nixosModules.wsl
        vscode-server.nixosModules.default
        ({ pkgs, ... }: {
          system = {
            stateVersion = "unstable";
          };
          programs.nix-ld.enable = true;
          services.vscode-server.enable = true;
          environment.systemPackages = [
            pkgs.wget
          ];

          wsl = {
            enable = true;
            defaultUser = "laomei";
            extraBin = with pkgs; [
              { src = "${coreutils}/bin/uname"; }
              { src = "${coreutils}/bin/dirname"; }
              { src = "${coreutils}/bin/readlink"; }
            ];
          };
        })

            ./nixos/vscode_patch.nix
            ./nixos/basic.nix
            ./hosts/wsl/config.nix
            ./nixos/devpkgs.nix
          ];
        };

      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {

        # FIXME replace with your username@hostname
        "laomei@libvirt" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;

          extraSpecialArgs = { inherit inputs outputs; };


          modules = [
            ./home-manager/home.nix
          ];
        };
        "laomei@wsl" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          # > Our main home-manager configuration file <
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
