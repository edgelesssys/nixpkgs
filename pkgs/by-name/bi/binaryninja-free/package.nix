{ autoPatchelfHook
, fetchurl
, stdenv
, lib
, unzip
, makeDesktopItem
, libGL
, glib
, fontconfig
, xorg
, wayland
, libxkbcommon
, dbus
, qt6Packages
, xkeyboard_config
}:

stdenv.mkDerivation rec {
  pname = "binaryninja-free";
  version = "4.0.4958";

  src = fetchurl {
    url = "https://web.archive.org/web/20240401143730/https://cdn.binary.ninja/installers/binaryninja_free_linux.zip";
    sha256 = "sha256-KJBUJKMqqBL2mJkDnRO3TCoyNYUdbi13iAbcUhXF8ac=";
  };

  icon = fetchurl {
    url = "http://web.archive.org/web/20240401144526/https://binary.ninja/icons/android-chrome-512x512.png";
    sha256 = "sha256-/f9RPsS7qrxqVhIzlNiIAVi0HKwGu/lV0DiGXsjBcFo=";
  };

  desktopItem = makeDesktopItem {
    name = "binaryninja-free";
    exec = "binaryninja";
    icon = icon;
    comment = meta.description;
    desktopName = "Binaryninja Free";
    genericName = "Interactive Disassembler";
    categories = [ "Development" ];
  };

  nativeBuildInputs = [ autoPatchelfHook unzip qt6Packages.wrapQtAppsHook ];

  buildInputs = [
    libGL
    stdenv.cc.cc.lib
    glib
    fontconfig
    xorg.libXi
    xorg.libXrender
    wayland
    libxkbcommon
    dbus
    xorg.libxcb
    qt6Packages.qtbase
  ];

  qtWrapperArgs = [ "--prefix QT_XKB_CONFIG_ROOT : ${xkeyboard_config}/share/X11/xkb" ];

  unpackPhase = ''
    runHook preUnpack

    mkdir -p $out/opt
    unzip $src -d $out/opt

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    ln -s $out/opt/binaryninja/binaryninja $out/bin/binaryninja
    chmod +x $out/bin/binaryninja

    addAutoPatchelfSearchPath $out/opt

    runHook postInstall
  '';

  meta = with lib; {
    description = "Binary Ninja is an interactive decompiler, disassembler, debugger, and binary analysis platform built by reverse engineers, for reverse engineers";
    changelog = "https://binary.ninja/changelog/";
    homepage = "https://binary.ninja/free/";
    license = licenses.unfree;
    mainProgram = "binaryninja";
    maintainers = with maintainers; [ msanft ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
  };
}
