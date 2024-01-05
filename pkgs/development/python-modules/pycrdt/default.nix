{ lib 
, buildPythonPackage
, fetchPypi
, pythonOlder
, rustPlatform
, cargo
, rustc
}:

buildPythonPackage rec {
  pname = "pycrdt";
  version = "0.7.2";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+JCaKzKCwD7Y0QsZutZO+AUXtMH8jN54INAuoWvjikQ=";
  };

  cargoDeps = rustPlatform.fetchCargoTarball {
    inherit src;
    name = "yrs-0.17.2";
    hash = "sha256-aEAl/fwzajujR1UhVk2Fk9+UR8cHRmpF9ByhKpGVIfQ=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    cargo
    rustc
  ];

  pythonImportsCheck = [
    "pycrdt"
  ];

  meta = with lib; {
    description = "Python bindings for Yrs";
    homepage = "https://github.com/jupyter-server/pycrdt";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
