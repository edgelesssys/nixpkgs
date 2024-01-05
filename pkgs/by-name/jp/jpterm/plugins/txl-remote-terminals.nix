{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonPackage rec {
  pname = "txl-remote-terminals";
  version = "0.1.24";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "txl_remote_terminals";
    sha256 = "sha256-5KbOtI6dUtPHKm7iC1F9z3F48Qt1MaUMSQlGJBm8/PE=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    txl
    httpx
    httpx-ws
  ];

  meta = with lib; {
    description = "TXL plugin for remote terminals";
    homepage = "https://github.com/davidbrochart/jpterm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

}
