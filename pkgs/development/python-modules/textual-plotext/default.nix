{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder

  # Build system
, poetry-core

  # Dependencies
, plotext
, textual
}:

buildPythonPackage rec {
  pname = "textual-plotext";
  version = "0.2.1";
  pyproject = true;

  disabled = pythonOlder "3.7.2";

  src = fetchPypi {
    inherit version;
    pname = "textual_plotext";
    sha256 = "sha256-vG8tddjiDdpjIfglTcPezaj0H2Dm5wo93YO2UriQwIE=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    plotext
    textual
  ];

  pythonImportsCheck = [
    "textual_plotext"
  ];

  meta = with lib; {
    description = "A Textual widget wrapper for the Plotext plotting library";
    homepage = "https://github.com/Textualize/textual-plotext";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
