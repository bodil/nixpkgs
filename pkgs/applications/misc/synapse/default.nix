{ stdenv, fetchbzr, pkgconfig, vala, gtk3, intltool, libnotify, libunique, json_glib
, keybinder3, libtool, automake111x, autoconf, gnome3_12, zeitgeist }:

stdenv.mkDerivation rec {
  name = "synapse-0.2.10";

  src = fetchbzr {
    url = "https://code.launchpad.net/~synapse-core/synapse-project/trunk";
    rev = "602";
    sha256 = "1hih0cq1593nzbyhzr6jgkgnr903ajlqyar0qcwzzx67jr7rj8c7";
  };

  meta = with stdenv.lib; {
    description = "Another launcher";
    homepage = https://launchpad.net/synapse-project;
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ bodil ];
    platforms = platforms.linux;
  };

  buildInputs = [ pkgconfig vala gtk3 intltool libnotify libunique json_glib
                  gnome3_12.libgee keybinder3 libtool automake111x autoconf
                  gnome3_12.gnome_common zeitgeist ];

  configurePhase = ''
    ./autogen.sh --prefix=$out --enable-zeitgeist=yes
  '';
}
