{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-terminal";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_terminal";
    sha256 = "sha256-lQHHiKcPgrL7AgR5D1glhniBbGGogpVzdm5h3j2Ncq0=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    pyte
  ];

  meta = with lib; {
    description = "TXL plugin for a terminal widget";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
