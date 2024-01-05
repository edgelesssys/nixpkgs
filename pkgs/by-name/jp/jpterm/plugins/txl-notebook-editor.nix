{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-notebook-editor";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_notebook_editor";
    sha256 = "sha256-cqVQv4V2lEcZHoaOF4uhHKzCn/6rl6Gr2beg2L3jZfk=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
  ];

  meta = with lib; {
    description = "TXL plugin for a notebook editor";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
