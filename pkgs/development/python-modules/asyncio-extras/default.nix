{ lib
, buildPythonPackage
, fetchPypi

  # build-system
, setuptools-scm
, setuptools

  # dependencies
, async_generator
}:

buildPythonPackage rec {
  pname = "asyncio-extras";
  version = "1.3.2";

  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "asyncio_extras";
    hash = "sha256-CEtivrwZxroQbUOKJ0u7VWaUHEaRKM1K8ahfAKLIH40=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [ async_generator ];

  pythonImportsCheck = [ "asyncio_extras" ];

  meta = with lib; {
    description = "Asynchronous generators, context managers and other utilities for use with asyncio";
    homepage = "https://github.com/agronholm/asyncio_extras";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
