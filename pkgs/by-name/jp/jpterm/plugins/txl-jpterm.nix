{ lib
, python3Packages
, fetchPypi
, txl-file-browser
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-jpterm";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_jpterm";
    sha256 = "sha256-4Aqj2C+6StyO3D/92zzMGrEAWsv0ERqaFF3Tykw+12Q=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
  ];

  meta = with lib; {
    description = "TXL plugin for the jpterm app";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
