{
  description = ''WebP Tools wrapper for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-webp-master.flake = false;
  inputs.src-webp-master.owner = "juancarlospaco";
  inputs.src-webp-master.ref   = "master";
  inputs.src-webp-master.repo  = "nim-webp";
  inputs.src-webp-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-webp-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-webp-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}