within GenKinetics.Reactions.Convenience.Dynamic;
partial model BasicRevReaction "basic declaration of a reversible reaction "
  extends BasicIrrReaction(redeclare final model Reversibility =
        Interfaces.Reversible.TwoWay);

  parameter Units.AffinityConst KmP[NP] = ones(NP) "affinity constants of the product node";

protected
  Real P1;
  Real P2;

equation

  P1 = Vbwdmax * product(rc_P.c ./ KmP);
  P2 = product(rc_P.c ./ KmP .+ 1);

end BasicRevReaction;
