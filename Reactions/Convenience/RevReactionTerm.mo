within GenKinetics.Reactions.Convenience;
partial model RevReactionTerm
  "The term of backward reaction rate within the kinetic law"
  extends GenKinetics.Reactions.Convenience.IrrReactionTerm;

  parameter Units.AffinityConst KmP[NP] = ones(NP) "affinity constants of the product node";
  parameter Units.ReactionCoef Vbwdmax = 1 "backward maximal reaction rate";

protected
  Real P1;
  Real P2;
  Real Pc[NP];

equation

  Pc = rc_P.c;
  P1 = Vbwdmax * product(Pc ./ KmP);
  P2 = product(Pc ./ KmP .+ 1);

end RevReactionTerm;
