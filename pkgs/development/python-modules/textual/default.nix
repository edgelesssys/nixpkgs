{ lib
, buildPythonPackage
, fetchFromGitHub
, importlib-metadata
, jinja2
, markdown-it-py
, poetry-core
, pytest-aiohttp
, pytestCheckHook
, pythonOlder
, rich
, syrupy
, time-machine
, tree-sitter
, tree-sitter-languages
, typing-extensions
}:

buildPythonPackage rec {
  pname = "textual";
  version = "0.41.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "Textualize";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-K3JpAVkw6njUT2AGGLL3ACagPK0K6Ny4PvCsbmuNvTo=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    importlib-metadata
    markdown-it-py
    rich
    typing-extensions
  ] ++ markdown-it-py.optional-dependencies.plugins
  ++ markdown-it-py.optional-dependencies.linkify
  ++ passthru.optional-dependencies.syntax;

  passthru.optional-dependencies = {
    syntax = [
      tree-sitter
      tree-sitter-languages
    ];
  };

  nativeCheckInputs = [
    jinja2
    pytest-aiohttp
    pytestCheckHook
    syrupy
    time-machine
  ] ++ passthru.optional-dependencies.syntax;

  disabledTestPaths = [
    # snapshot tests require syrupy<4
    "tests/snapshot_tests/test_snapshots.py"
  ];

  disabledTests = [
    # Assertion issues
    "test_textual_env_var"
    "test_softbreak_split_links_rendered_correctly"

    # requires tree-sitter-languages which is not packaged in nixpkgs
    "test_register_language"
    "test_setting_builtin_language_via_constructor"
    "test_setting_builtin_language_via_attribute"
    "test_setting_language_to_none"
    "test_setting_unknown_language"
    "test_register_language"
    "test_register_language_existing_language"
    "test_default_theme"
    "test_setting_builtin_themes"
    "test_setting_theme_to_none"
    "test_setting_unknown_theme_raises_exception"
    "test_registering_and_setting_theme"
  ];

  pythonImportsCheck = [
    "textual"
  ];

  __darwinAllowLocalNetworking = true;

  meta = with lib; {
    description = "TUI framework for Python inspired by modern web development";
    homepage = "https://github.com/Textualize/textual";
    changelog = "https://github.com/Textualize/textual/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ joelkoen ];
  };
}
