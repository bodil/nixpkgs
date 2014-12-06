{ fetchgit, stdenv, pandoc
}:

stdenv.mkDerivation rec {
  name = "i3blocks-1.3";

  src = fetchgit {
    url = "https://github.com/vivien/i3blocks.git";
    rev = "refs/tags/1.3";
    sha256 = "c3837593e10cb6c41cbc82f012591007c944898b18c9ffde8b8ce2c8b975b800";
  };

  buildInputs = [ pandoc ];

  patchPhase = ''
    sed -i -e 's@ronn -w -r@pandoc -f markdown -t man -o i3blocks.1@' Makefile;
  '';

  makeFlags = "clean all";
  installFlags = "PREFIX=\${out}";

  meta = {
    description = "A flexible scheduler for i3bar";
    homepage = http://vivien.github.io/i3blocks/;
    maintainers = [ stdenv.lib.maintainers.bodil ];
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.all;
  };

}
