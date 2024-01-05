{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder

  # Build system
, hatchling

  # Dependencies
, pillow
, rich
, textual
}:

buildPythonPackage rec {
  pname = "textual-imageview";
  version = "0.1.1";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit version;
    pname = "textual_imageview";
    sha256 = "sha256-QpnY7Wd9sK24/pRWh0cM8UIdyv0qXd2rVLbujvKrMyA=";
  };

  nativeBuildInputs = [
    hatchling
  ];

  propagatedBuildInputs = [
    pillow
    rich
    textual
  ];

  pythonImportsCheck = [
    "textual_imageview"
  ];

  meta = with lib; {
    description = "CLI tool and Textual widget and for viewing images in the terminal.";
    homepage = "https://github.com/adamviola/textual-imageview";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
