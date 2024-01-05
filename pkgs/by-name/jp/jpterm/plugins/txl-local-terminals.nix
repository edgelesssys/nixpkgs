{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-local-terminals";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_local_terminals";
    sha256 = "sha256-42bc+NZkaor3/l1+mU96fOIrNKWT2S/JPopDrlmHO0A=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    anyio
  ];

  meta = with lib; {
    description = "TXL plugin for local terminals";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
