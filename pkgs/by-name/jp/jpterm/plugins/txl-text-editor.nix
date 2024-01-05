{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-text-editor";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_text_editor";
    sha256 = "sha256-fZ629i58lMV5BU9hq+IGrYRdrJPjJJt5ACMi9SA3vcI=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
  ];

  meta = with lib; {
    description = "TXL plugin for a text editor";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
