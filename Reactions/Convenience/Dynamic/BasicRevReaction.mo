within GenKinetics.Reactions.Convenience.Dynamic;
partial model BasicRevReaction "basic declaration of a reversible reaction "
  extends BasicIrrReaction(redeclare final model Reversibility =
        Interfaces.Reversible.TwoWay);

  parameter Units.AffinityConst KmP[NP] = ones(NP) "affinity constants of the product node";

protected
  Real P1;
  Real P2;
  Real Pc[NP]; 

equation

  Pc = rc_P.c; 
  P1 = Vbwdmax * product(Pc ./ KmP);
  P2 = product(Pc ./ KmP .+ 1);

end BasicRevReaction;
