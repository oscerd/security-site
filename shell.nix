{ pkgs ? import <nixpkgs> { } }:

let
  ahapi = pkgs.python3Packages.buildPythonPackage {
    name = "ahapi";
    pyproject = true;
    src = pkgs.fetchFromGitHub {
      owner = "Humbedooh";
      repo = "ahapi";
      rev = "afb33381d2f17207e37e7b3bdaa95991e4aa1c5a";
      hash = "sha256-/x/wfdp8oHn+uuerHe0/7gQdXNq08bWiUxiqk2ZdWE4=";
    };
    build-system = with pkgs.python3Packages; [
      setuptools
    ];
    dependencies = with pkgs.python3Packages; [
      aiohttp
      multipart
    ];
  };
in
pkgs.mkShell {
  buildInputs = [
    (pkgs.python3.withPackages(p: [
      p.beautifulsoup4
      p.requests
      p.packaging
      p.python-dotenv
      p.pygithub
      p.pytest

      # for ecosystem-graph
      (p.lib4sbom.overrideAttrs(a: {
        patches = (a.patches or []) ++ [
          (pkgs.fetchpatch {
            # https://github.com/anthonyharrison/lib4sbom/pull/58
            url = "https://github.com/anthonyharrison/lib4sbom/commit/181549e90d092fe943327334cba8866ed8f111a1.patch";
            hash = "sha256-STiuoIv4of7xpa99/dfkJYl2IyD1mMcbswN9S4RPBpc=";
          })
        ];
      }))
      p.networkx

      # for app
      ahapi
    ]))
  ];
  shareNet = true;
}
