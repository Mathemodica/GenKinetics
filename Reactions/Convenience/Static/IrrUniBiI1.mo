within GenKinetics.Reactions.Convenience.Static;
model IrrUniBiI1 "S + I => P1 + P2"
  extends Interfaces.Static.ReactionUniBiI1;
  extends Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vfwdmax;
  parameter Units.AffinityConst ki;

protected
  model Kinetic =   GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic (
    redeclare final model Dimensionality =
      GenKinetics.Interfaces.Dynamic.Dimension.UniBi,
    redeclare final model Inhibition =
      GenKinetics.Interfaces.Dynamic.Modifier.OneInhibitor);

  Kinetic kinetic(KmS = {km},Vfwdmax = Vfwdmax, KI = {ki});

equation

  connect(rc_S1,kinetic.rc_S[1]);

  connect(rc_P1,kinetic.rc_P[1]);
  connect(rc_P2,kinetic.rc_P[2]);

  connect(mc_I1,kinetic.mc_I[1]);

  kinetic.v = v;

end IrrUniBiI1;
