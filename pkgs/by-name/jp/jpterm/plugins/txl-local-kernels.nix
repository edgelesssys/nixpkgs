{ lib
, python3Packages
, fetchPypi
, txl-kernel
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-local-kernels";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_local_kernels";
    sha256 = "sha256-cpArWdYbMs71H1omlR2LA1/xgUb6/5BYzcC9tLZxmHE=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    txl-kernel
    pyzmq
    y-py
  ];

  meta = with lib; {
    description = "TXL plugin for local kernels";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
