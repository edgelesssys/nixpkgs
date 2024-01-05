{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-remote-contents";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_remote_contents";
    sha256 = "sha256-uopxI3nZRydIK+2YayCbmkggbeh4v6zyL6DwutLWT18=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    httpx
    httpx-ws
    jupyter-ydoc
    y-py
    ypy-websocket
  ];

  meta = with lib; {
    description = "TXL plugin for remote contents";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
