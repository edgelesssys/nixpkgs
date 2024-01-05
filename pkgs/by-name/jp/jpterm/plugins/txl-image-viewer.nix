{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-image-viewer";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_image_viewer";
    sha256 = "sha256-+XLca5Ek0DeH2e3zG1I76EBRlGON4ZPSmbCcdLiJd1I=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    textual-imageview
  ];

  meta = with lib; {
    description = "TXL plugin for an image viewer";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
