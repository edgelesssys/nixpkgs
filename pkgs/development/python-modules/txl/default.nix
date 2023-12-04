{ lib
, buildPythonPackage
, fetchPypi
, asphalt
, textual
, y-py
, hatchling
}:

buildPythonPackage rec {
  pname = "txl";
  version = "0.1.22";

  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-mkhBzCjUchQ14A/HX5WIJTLaB0OgnHYSfuFVGiFjbbQ=";
  };

  propagatedBuildInputs = [
    asphalt
    textual
    y-py
    hatchling
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
