
### This is Noto Color Emoji using the original blobs

The older version of the blobs from Google with [C1710's set](https://github.com/C1710/blobmoji) (contains original work) to fill the gaps.

There may be sevaral issues with these as I haven't tested them extensively and C1710's new blobs are subtly different in style so it's a little mixed. I also don't normally do emojis or fonts, so don't trust me to not have screwed something up. 

Aside from the font family name being OGBlobs (rather than Blobmoji) I refer to C1710's repo for instructions on how to build/install/use this, except for Nix(OS) users who have it easy (see below).

I welcome feedback and PR's but I don't plan on working on the set personally - I simply wanted these specific blobs.

Blobs are best emojis and OG blobs are best blobs.

![OGBlobs in Spectral](images/OGBlobs-in-Spectral.png)


#### Nix(OS) instructions

You can simply install this either with `nix-env -if ./shell.nix` from within the cloned repo 
or:
1. Download the `default.nix` file to anywhere you please 
2. Replace `src = ./.;` with
```nix
      src = fetchFromGitHub {
        owner = "lboklin";
        repo = "noto-emoji-ogblobs";
        rev = "v${version}";
        # if you update the rev it'll tell you what it should be while complaining
        sha256 = "04i4m7mpi7zp99xxj8mqd83fbcaj2a80yh1jckwcl2bm152pby15"; 
      };
```
3. Add it to your NixOS configuration: `fonts.fonts = [ (pkgs.callPackage ./path/to/blobs-default.nix {}) ];`

I also have it in [my nixpkgs fork](https://github.com/lboklin/nixpkgs) as `noto-fonts-emoji-ogblobs`.
