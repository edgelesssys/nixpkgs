{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-notebook-viewer";
  version = "0.1.17";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_notebook_viewer";
    sha256 = "sha256-89QrjO9+szl5s1ZnUF9z95QJ+uKRSCMVH0ySPJaLQXA=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
  ];

  meta = with lib; {
    description = "TXL plugin for a notebook viewer";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
