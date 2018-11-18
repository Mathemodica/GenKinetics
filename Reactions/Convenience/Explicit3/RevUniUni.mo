within GenKinetics.Reactions.Convenience.Explicit3;
model RevUniUni "S <=> P"
  extends Interfaces.Reactions.UniUniRev;
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst kmS;
  parameter Units.ReactionCoef Vfwdmax;
  parameter GenKinetics.Units.AffinityConst kmP;
  parameter Units.ReactionCoef Vbwdmax;

protected
  model Kinetic = GenKinetics.Reactions.Convenience.Auto.RevKinetic (redeclare
        final model Dimensionality =
          GenKinetics.Interfaces.Reactions.Basics.Auto.Dimension.UniUni);

  Kinetic kinetic(KmS = {kmS},Vfwdmax = Vfwdmax,KmP = {kmP},Vbwdmax = Vbwdmax);
equation

  connect(rc_S1,kinetic.rc_S[1]);
  connect(rc_P1,kinetic.rc_P[1]);

  v = kinetic.v;

end RevUniUni;
