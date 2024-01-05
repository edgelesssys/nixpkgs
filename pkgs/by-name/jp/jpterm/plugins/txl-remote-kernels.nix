{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-remote-kernels";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_remote_kernels";
    sha256 = "sha256-MHxgJ1780jmi6ggYGHt/jZMBLPEwjX9UBCJZRStdWTU=";
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
  ];

  meta = with lib; {
    description = "TXL plugin for remote kernels";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
