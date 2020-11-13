{ nixpkgs ? import ./nixpkgs.nix
}:
let
  inherit (nixpkgs) pkgs;

  revealjs = pkgs.fetchgit {
    url = "https://github.com/hakimel/reveal.js.git";
    rev = "4.1.0";
    sha256 = "10xhblbyw8mvak58d294hbxxnf5sq0akj6qldv7brgm6944zppm0";
  };

  local = ./.;
in
  pkgs.stdenv.mkDerivation {
    name = "fp-survival-kit";
    src = ./.;
    preferLocalBuild = true;
    allowSubstitutes = false;

    unpackPhase = ''
      mkdir -p $name/{reveal.js,css,images,js}
      cd $name
      cp -r ${revealjs}/* ./reveal.js/
      cp $src/css/* ./css/
      # rm ./css/grid-light.css
      cp $src/images/* ./images/
    '';

    buildPhase = ''
      cat \
          $src/slides/title.md \
          $src/slides/intro.md \
          $src/slides/features.md \
          $src/slides/references.md \
          > slides.md
      pandoc -i -t revealjs --slide-level=2 --template=$src/template.revealjs --variable=codedir:$out --variable=transition:none --no-highlight -s slides.md -o index.html
      rm slides.md
    '';

    installPhase = ''
      mkdir $out
      cp -r ./* $out/
    '';

    phases = ["unpackPhase" "buildPhase" "installPhase"];

    buildInputs = [pkgs.pandoc];
  }
