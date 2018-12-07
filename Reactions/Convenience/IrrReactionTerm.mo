within GenKinetics.Reactions.Convenience;
partial model IrrReactionTerm
  "The term of forward reaction rate within the kinetic law"
  extends GenKinetics.Reactions.BasicReaction;

  parameter Units.AffinityConst KmS[NS] = ones(NS) "affinity constants of the substrate nodes";
  parameter Units.ReactionCoef Vfwdmax = 1 "maximal forward reaction rate";

protected
  Real S1 "Kinetic terms";
  Real S2;
  Real cS[NS];

equation

  cS = rc_S.c;
  S1 = Vfwdmax * product(cS ./ KmS);
  S2 = product(cS ./ KmS .+ 1);

end IrrReactionTerm;
