{
  description = "my nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.11";
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
        me = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = {
            inherit inputs username;
          };
          modules = [ ./home-manager ];
        };
      };

      darwinConfigurations = {
        me = nix-darwin.lib.darwinSystem {
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
              nix run nixpkgs#home-manager -- switch --flake .#me --impure
              echo "Updating nix-darwin..."
              sudo -E nix run nix-darwin -- switch --flake .#me --impure
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
              nix run nixpkgs#home-manager -- switch --flake .#me --impure
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
              sudo -E nix run nix-darwin -- switch --flake .#me --impure
              echo "Update complete!"
            ''
          );
        };
      };
    };
}
