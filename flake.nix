{
  description = "A flake for the original Noto Sans blob emojis";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.ogblobs =
      with import nixpkgs { system = "x86_64-linux"; };
      callPackage ./default.nix {};

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.ogblobs;

  };
}
