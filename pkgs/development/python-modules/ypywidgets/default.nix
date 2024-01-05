{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, hatchling
, comm
, pycrdt
, reacttrs
}:

buildPythonPackage rec {
  pname = "ypywidgets";
  version = "0.6.4";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pecBs5YOkGngBhrXA+9JQHKKbCxWgDMUhRcdnk84ynM=";
  };

  nativeBuildInputs = [
    hatchling
  ];

  propagatedBuildInputs = [
    comm
    pycrdt
    reacttrs
  ];

  pythonImportsCheck = [
    "ypywidgets"
  ];

  meta = with lib; {
    description = "Y-based Jupyter widgets for Python";
    homepage = "https://github.com/davidbrochart/ypywidgets";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
