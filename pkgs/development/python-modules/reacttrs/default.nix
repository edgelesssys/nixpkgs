{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder

  # Build system
, hatchling
}:

buildPythonPackage rec {
  pname = "reacttrs";
  version = "0.1.4";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-gREQFT7BUj2Hitc0TzYvx3+P06lx2/MWhxWVV945c4U=";
  };

  nativeBuildInputs = [
    hatchling
  ];


  pythonImportsCheck = [
    "reacttrs"
  ];

  meta = with lib; {
    description = "Attributes with superpowers";
    homepage = "https://github.com/davidbrochart/reacttrs";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
