{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-markdown-viewer";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_markdown_viewer";
    sha256 = "sha256-EejPATVoEVQB036xUx7/Y0jschmQxcxWLwzLeYKOLIg=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
  ];

  meta = with lib; {
    description = "TXL plugin for a Markdown viewer";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
