{ lib
, python3Packages
, fetchFromGitHub
}:

python3Packages.buildPythonApplication rec {
  pname = "jpterm";
  version = "0.1.22";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "davidbrochart";
    repo = "jpterm";
    rev = "refs/tags/v${version}";
    hash = "sha256-t4m8w6z0I4xfrIj3BBRoJo05Ghsmsl1xucUF9VNtiow=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
    setuptools
  ];

  propagatedBuildInputs = with python3Packages; [
    rich-click
    txl
    ruamel-yaml
  ];

  # preCheck = ''
  #   mkdir test-reports
  # '';

  # pythonImportsCheck = [
  #   "nordicsemi"
  # ];

  meta = with lib; {
    homepage = "https://github.com/davidbrochart/jpterm";
    description = " Jupyter in the terminal ";
    license = licenses.mit;
    maintainers = with maintainers; [ msanft ];
  };
}
