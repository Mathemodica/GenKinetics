within GenKinetics.Reactions.Convenience.Static;
model RevUniUni "S <=> P"
  extends Interfaces.Static.ReactionUniUni;
  extends Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst kmS;
  parameter Units.ReactionCoef Vfwdmax;
  parameter GenKinetics.Units.AffinityConst kmP;
  parameter Units.ReactionCoef Vbwdmax;


protected
  model Kinetic =  GenKinetics.Reactions.Convenience.Dynamic.RevKinetic(redeclare
        final model
      Dimensionality = GenKinetics.Interfaces.Dynamic.Dimension.UniUni);

  Kinetic kinetic(KmS = {kmS},Vfwdmax = Vfwdmax,KmP = {kmP},Vbwdmax = Vbwdmax);
equation

  connect(rc_S1,kinetic.rc_S[1]);
  connect(rc_P1,kinetic.rc_P[1]);

  v = kinetic.v;

end RevUniUni;
