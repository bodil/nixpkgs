{ stdenv, fetchgit, qt53 }:

stdenv.mkDerivation {
  name = "spike-1.1";

  meta = with stdenv.lib; {
    description = "An application launcher in the style of dmenu";
    homepage = https://github.com/bodil/spike;
    license = licenses.gpl3;
    maintainers = [ maintainers.bodil ];
    platform = platforms.unix;
  };

  src = fetchgit {
    url = "git://github.com/bodil/spike";
    rev = "refs/tags/1.1";
    sha256 = "1j08kfk6s8nimcy6h4ml3pr8ynh7k17ykhhg3binazhxhxgp9cml";
  };

  buildInputs = [ qt53 ];

  configurePhase = "qmake PREFIX=$out";

  installPhase = ''
    mkdir -p $out/bin
    strip build/spike
    install build/spike $out/bin/spike
  '';
}
