{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-kernel";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_kernel";
    sha256 = "sha256-VGvRit1EzIiMXNSc15Z14UcFOiQIYndmj1v/GtEujJo=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    y-py
    dateutil
  ];

  meta = with lib; {
    description = "TXL plugin for a kernel driver";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
