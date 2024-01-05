{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, hatchling
, hatch-regex-commit
, httpx
, anyio
, httpcore
, wsproto
}:

buildPythonPackage rec {
  pname = "httpx-ws";
  version = "0.4.3";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit version;
    pname = "httpx_ws";
    hash = "sha256-uwmX7Eo/9fnYhjHA3Bluu9fO5mm0Qbn5MiHu/EzMfdY=";
  };

  nativeBuildInputs = [
    hatchling
    hatch-regex-commit
  ];

  propagatedBuildInputs = [
    anyio
    httpx
    httpcore
    wsproto
  ];

  pythonImportsCheck = [
    "httpx_ws"
  ];

  meta = with lib; {
    description = "Authentication classes to be used with httpx";
    homepage = "https://github.com/frankie567/httpx-ws/";
    changelog = "https://github.com/frankie567/httpx-ws/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
