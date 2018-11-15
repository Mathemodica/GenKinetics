within GenKinetics.Reactions.Convenience.Static3;
model IrrUniUni "S => P"
  extends Interfaces.Static.ReactionUniUni;
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vmax;

protected
  model Kinetic = Dynamic.IrrKinetic (redeclare final model Dimensionality =
          GenKinetics.Interfaces.Reactions.Basics.Base.Dimension.UniUni);
  Kinetic kinetic(KmS = {km},Vfwdmax = Vmax);

equation

  connect(rc_S1,kinetic.rc_S[1]);
  // rc_S1.c = rc_S[1].c;
  // rc_S1.r = rc_S[1].r;

  connect(rc_P1,kinetic.rc_P[1]);
  // rc_P1.c = rc_P[1].c;
  // rc_P1.r = rc_P[1].r;

  v = kinetic.v;

end IrrUniUni;
