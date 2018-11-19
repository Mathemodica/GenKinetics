within GenKinetics.Reactions.Convenience.Explicit3;
model IrrUniBiI1 "S + I => P1 + P2"
  extends Interfaces.Reactions.Ubi;
  extends Interfaces.Reactions.ReactionRate;
  extends Interfaces.Reactions.Modifiers.Inhibitor;

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vfwdmax;
  parameter Units.AffinityConst ki;

protected
  model Kinetic = GenKinetics.Reactions.Convenience.Auto.InhIrrKinetic (
        redeclare final model Dimensionality =
          GenKinetics.Interfaces.Reactions.Basics.Auto.Dimension.UniBi,
        redeclare final model Inhibition =
          GenKinetics.Interfaces.Reactions.Modifiers.Auto.Inhibitor);

  Kinetic kinetic(KmS = {km},Vfwdmax = Vfwdmax, KI = {ki});

equation

  connect(rc_S1,kinetic.rc_S[1]);

  connect(rc_P1,kinetic.rc_P[1]);
  connect(rc_P2,kinetic.rc_P[2]);

  connect(mc_I1,kinetic.mc_I[1]);

  kinetic.v = v;

end IrrUniBiI1;
