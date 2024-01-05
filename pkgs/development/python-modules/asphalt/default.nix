{ lib
, buildPythonPackage
, fetchPypi

  # build-system
, setuptools-scm
, setuptools

  # dependencies
, asyncio-extras
, click
, ruamel-yaml
, importlib-metadata
, async-generator
, async-timeout
, typing-extensions
}:

buildPythonPackage rec {
  pname = "asphalt";
  version = "4.12.0";

  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IeKzI6uoM+zR6oR0a1XUht5QJ/EZmHUo3beyDAJy0Q4=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [
    "asphalt"
    "asphalt.core"
    "asphalt.core.cli"
    "asphalt.core.component"
    "asphalt.core.concurrent"
    "asphalt.core.context"
    "asphalt.core.event"
    "asphalt.core.runner"
    "asphalt.core.utils"
  ];

  propagatedBuildInputs = [
    asyncio-extras
    click
    ruamel-yaml
    importlib-metadata
    async-generator
    async-timeout
    typing-extensions
  ];

  meta = with lib; {
    description = "A microframework for network oriented applications";
    homepage = "https://github.com/asphalt-framework/asphalt";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}
