{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-local-contents";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_local_contents";
    sha256 = "sha256-rdqix67eABDTew9GIjURGKFuUC5+gywX1lGxrY4iNxw=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    y-py
    anyio
  ];

  meta = with lib; {
    description = "TXL plugin for local contents";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
