# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, deepseq, HUnit, QuickCheck, quickcheckUnicode, random
, testFramework, testFrameworkHunit, testFrameworkQuickcheck2
}:

cabal.mkDerivation (self: {
  pname = "text";
  version = "1.2.0.2";
  sha256 = "1ia9ygns4yz46pmzbswvl7mgbmgw6ywnpk0cfjsgc6p9i3xxpv96";
  buildDepends = [ deepseq ];
  testDepends = [
    deepseq HUnit QuickCheck quickcheckUnicode random testFramework
    testFrameworkHunit testFrameworkQuickcheck2
  ];
  doCheck = false;
  meta = {
    homepage = "https://github.com/bos/text";
    description = "An efficient packed Unicode text type";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})