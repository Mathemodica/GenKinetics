within GenKinetics.Reactions.Convenience.Static3;
model IrrUniUniI1 "S + I => P"
  extends Interfaces.Static.ReactionUniUni1I;
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vmax;
  parameter Units.AffinityConst ki;

protected
  model Kinetic = GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic (
        redeclare final model Dimensionality =
          GenKinetics.Interfaces.Reactions.Basics.Base.Dimension.UniUni,
        redeclare final model Inhibition =
          GenKinetics.Interfaces.Reactions.Modifiers.Base.OneInhibitor);

  Kinetic kinetic(KmS = {km},Vfwdmax = Vmax,KI = {ki});

equation

  connect(rc_S1,kinetic.rc_S[1]);
  // rc_S1.c = rc_S[1].c;
  // rc_S1.r = rc_S[1].r;

  connect(rc_P1,kinetic.rc_P[1]);
  // rc_P1.c = rc_P[1].c;
  // rc_P1.r = rc_P[1].r;

  connect(mc_I1,kinetic.mc_I[1]);

  v = kinetic.v;

end IrrUniUniI1;
