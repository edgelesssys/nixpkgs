{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, tree-sitter
, cython
}:

buildPythonPackage rec {
  pname = "tree-sitter-languages";
  version = "1.8.0";

  src = fetchFromGitHub {
    owner = "grantjenks";
    repo = "py-tree-sitter-languages";
    rev = "v${version}";
    sha256 = "sha256-UXYlHAXQkxZfZ4xT3VChVXevglxTnwDrMqD8A44zxLU=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    tree-sitter
    cython
  ];

  pythonImportsCheck = [
    "tree_sitter_languages"
  ];

  meta = with lib; {
    description = "Binary Python wheels for all tree sitter languages";
    homepage = "https://github.com/grantjenks/py-tree-sitter-languages";
    license = licenses.asl20;
    maintainers = with maintainers; [ msanft ];
  };
}
