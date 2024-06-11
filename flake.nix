{
  description = "A flake for the original Noto Sans blob emojis";

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    ogblobs = pkgs.callPackage ./default.nix {};
  in {

    packages.x86_64-linux.default = ogblobs;
    packages.x86_64-linux.ogblobs = ogblobs;

  };
}
