within GenKinetics.Reactions.Convenience.Dynamic;
partial model BasicIrrReaction "basic declaration of an irreversible reaction "
  extends BasicReaction;

  parameter Units.AffinityConst KmS[NS] = ones(NS) "affinity constants of the substrate nodes";

protected
  Real S1 "Kinetic terms";
  Real S2;
  Real cS[NS];

equation

  cS = rc_S.c;
  S1 = Vfwdmax * product(cS ./ KmS);
  S2 = product(cS ./ KmS .+ 1);

end BasicIrrReaction;
