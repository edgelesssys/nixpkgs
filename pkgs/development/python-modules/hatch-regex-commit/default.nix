{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, hatchling
}:

buildPythonPackage rec {
  pname = "hatch-regex-commit";
  version = "0.0.3";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit version;
    pname = "hatch_regex_commit";
    hash = "sha256-+m5LIh3Y1meQHIbmNXcWWA0njFu6bJND5HaMGusOmzg=";
  };

  patches = [
    # hatch_regex_commit depends on itself for versioning, creating a bootstrapping problem.
    # We don't need the versioning functionality, so we can just patch it out.
    ./remove-self-dependency.patch
  ];

  propagatedBuildInputs = [
    hatchling
  ];

  meta = with lib; {
    description = "Hatch plugin to create a commit and tag when bumping version";
    homepage = "https://github.com/frankie567/hatch-regex-commit/";
    changelog = "https://github.com/frankie567/hatch-regex-commit/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
