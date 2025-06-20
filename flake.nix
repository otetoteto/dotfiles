{
  description = "my nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
    }:
    let
      system = "aarch64-darwin";
      username = builtins.getEnv "NIX_USER";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;

      homeConfigurations = {
        home-otetoteto = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = {
            inherit inputs username;
          };
          modules = [ ./home-manager ];
        };
      };

      darwinConfigurations = {
        darwin-otetoteto = nix-darwin.lib.darwinSystem {
          system = system;
          specialArgs = { inherit inputs username; };
          modules = [ ./nix-darwin ];
        };
      };

      apps.${system} = {
        update = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#home-otetoteto --impure
              echo "Updating nix-darwin..."
              sudo -E nix run nix-darwin -- switch --flake .#darwin-otetoteto --impure
              echo "Update complete!"
            ''
          );
        };

        update-home = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#home-otetoteto --impure
              echo "Update complete!"
            ''
          );
        };

        update-darwin = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating nix-darwin..."
              sudo -E nix run nix-darwin -- switch --flake .#darwin-otetoteto --impure
              echo "Update complete!"
            ''
          );
        };
      };
    };
}
