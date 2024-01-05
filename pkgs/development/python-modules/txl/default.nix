{ lib
, buildPythonPackage
, fetchPypi
, asphalt
, textual
, y-py
, hatchling
, tree-sitter-languages
}:

buildPythonPackage rec {
  pname = "txl";
  version = "0.1.24";

  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Wva2Bomt60Ew6v+J1ZmkwfYHq61XABE3IvPDp0J+fP0=";
  };

  nativeBuildInputs = [
    hatchling
  ];

  propagatedBuildInputs = [
    asphalt
    textual
    y-py

  ];

  pythonImportsCheck = [
    "txl"
    "txl.app"
    "txl.base"
    "txl.cli"
    "txl.text_input"
  ];

  meta = with lib; {
    description = "The plugin system for jpterm";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
