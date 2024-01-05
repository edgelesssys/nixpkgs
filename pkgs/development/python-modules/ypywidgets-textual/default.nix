{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, hatchling
, ypywidgets
, textual
, textual-plotext
, pyte
}:

buildPythonPackage rec {
  pname = "ypywidgets-textual";
  version = "0.2.2";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit version;
    pname = "ypywidgets_textual";
    hash = "sha256-Ql+NTnR+Zh/LF92keXCE8v3VC+7waJ1ej+4F50Dkpf8=";
  };

  nativeBuildInputs = [
    hatchling
  ];

  propagatedBuildInputs = [
    ypywidgets
    textual
    textual-plotext
    pyte
  ];

  pythonImportsCheck = [
    "ypywidgets_textual"
  ];

  meta = with lib; {
    description = "Textual widgets for ypywidgets";
    homepage = "https://github.com/davidbrochart/ypywidgets-textual";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
