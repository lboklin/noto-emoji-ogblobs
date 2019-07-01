{ stdenv, optipng, cairo, pythonPackages, pkgconfig,
pngquant, which, imagemagick }:

let version = "2019-07-01-original-blobs";
in stdenv.mkDerivation {
  name = "noto-fonts-emoji-ogblobs";

  src = ./.;

  buildInputs = [ cairo ];
  nativeBuildInputs = [ pngquant optipng which cairo pkgconfig imagemagick ]
                  ++ (with pythonPackages; [ python fonttools nototools ]);

  postPatch = ''
    sed -i 's,^PNGQUANT :=.*,PNGQUANT := ${pngquant}/bin/pngquant,' Makefile
    patchShebangs flag_glyph_name.py
  '';

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/share/fonts/noto
    cp NotoColorEmoji.ttf $out/share/fonts/noto
  '';

  meta = with stdenv.lib; {
    inherit version;
    description = "Color and Black-and-White emoji fonts";
    homepage = https://github.com/googlei18n/noto-emoji;
    license = with licenses; [ ofl asl20 ];
    platforms = platforms.all;
    maintainers = with maintainers; [ mathnerd314 ];
  };
}
