let nixpkgs = import ./nix { }; in

let stdenv = nixpkgs.stdenv; in

rec {
  doc = stdenv.mkDerivation {
    name = "doc";
    src = ./doc;
    outputs = [ "out" ];
    buildInputs = with nixpkgs;
      [ bash perl asciidoctor ];
    buildPhase = ''
      patchShebangs .
      mkdir -p $out
      asciidoctor index.adoc -o $out/index.html
    '';
    installPhase = ''
      echo Foo
    '';
  };
}
