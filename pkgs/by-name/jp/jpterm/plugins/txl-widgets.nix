{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-widgets";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_widgets";
    sha256 = "sha256-j6dDJ8d88YIynlUVz7dd1ySPghWRne4c4nLkcQs1K38=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    ypywidgets
    ypywidgets-textual
  ];

  meta = with lib; {
    description = "TXL plugin for kernel widgets";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
