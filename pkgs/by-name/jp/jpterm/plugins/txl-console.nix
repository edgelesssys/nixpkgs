{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-console";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_console";
    sha256 = "sha256-TMKQehQv2seVV2kjcD/0K9S4I5o6UfT57Z82sZ2ED7A=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    jupyter-ydoc
  ];

  meta = with lib; {
    description = "TXL plugin for a Jupyter console";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
