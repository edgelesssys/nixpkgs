{ lib
, python3Packages
, fetchFromGitHub
, callPackage
, fetchPypi
}:
let
  txl-cell = callPackage ./plugins/txl-cell.nix { };
  txl-console = callPackage ./plugins/txl-console.nix { };
  txl-editors = callPackage ./plugins/txl-editors.nix { };
  txl-file-browser = callPackage ./plugins/txl-file-browser.nix { };
  txl-image-viewer = callPackage ./plugins/txl-image-viewer.nix { };
  txl-jpterm = callPackage ./plugins/txl-jpterm.nix { inherit txl-file-browser; };
  txl-kernel = callPackage ./plugins/txl-kernel.nix { };
  txl-launcher = callPackage ./plugins/txl-launcher.nix { };
  txl-local-contents = callPackage ./plugins/txl-local-contents.nix { };
  txl-local-kernels = callPackage ./plugins/txl-local-kernels.nix { inherit txl-kernel; };
  txl-local-terminals = callPackage ./plugins/txl-local-terminals.nix { };
  txl-markdown-viewer = callPackage ./plugins/txl-markdown-viewer.nix { };
  txl-notebook-editor = callPackage ./plugins/txl-notebook-editor.nix { };
  txl-notebook-viewer = callPackage ./plugins/txl-notebook-viewer.nix { };
  txl-remote-contents = callPackage ./plugins/txl-remote-contents.nix { };
  txl-remote-kernels = callPackage ./plugins/txl-remote-kernels.nix { };
  txl-remote-terminals = callPackage ./plugins/txl-remote-terminals.nix { };
  txl-terminal = callPackage ./plugins/txl-terminal.nix { };
  txl-text-editor = callPackage ./plugins/txl-text-editor.nix { };
  txl-text-viewer = callPackage ./plugins/txl-text-viewer.nix { };
  txl-widgets = callPackage ./plugins/txl-widgets.nix { };
in
python3Packages.buildPythonApplication rec {
  pname = "jpterm";
  version = "0.1.24";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "davidbrochart";
    repo = "jpterm";
    rev = "refs/tags/v${version}";
    hash = "sha256-7AeqmHZjz7NNzOAGs97OxzCofaTJvYc++/CFS1WrKuo=";
  };

  nativeBuildInputs = with python3Packages; [
    hatchling
    setuptools
  ];

  propagatedBuildInputs = with python3Packages; [
    rich-click
    txl
    ruamel-yaml

    txl-cell
    txl-console
    txl-editors
    txl-file-browser
    txl-image-viewer
    txl-jpterm
    txl-kernel
    txl-launcher
    txl-local-contents
    txl-local-kernels
    txl-local-terminals
    txl-markdown-viewer
    txl-notebook-editor
    txl-notebook-viewer
    txl-remote-contents
    txl-remote-kernels
    txl-remote-terminals
    txl-terminal
    txl-text-editor
    txl-text-viewer
    txl-widgets
  ];

  meta = with lib; {
    homepage = "https://github.com/davidbrochart/jpterm";
    description = " Jupyter in the terminal ";
    license = licenses.mit;
    maintainers = with maintainers; [ msanft ];
  };
}
