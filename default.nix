{ lib, buildGoModule }:

buildGoModule rec {
  pname = "postfix-tlspol";
  version = "1.7.3";

  src = ./.;

  # this repo vendors dependencies -> set to null
  vendorHash = null;

  doCheck = false;

  meta = {
    description = "Lightweight MTA-STS + DANE/TLSA resolver and TLS policy server for Postfix, prioritizing DANE. ";
    homepage = "https://github.com/Zuplu/postfix-tlspol";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ valodim ];
  };
}
