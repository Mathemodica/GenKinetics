within GenKinetics.Reactions.Convenience.Static2;
model IrrUniUni "S => P"
  extends Interfaces.Static.ReactionUniUni;

  Dynamic.IrrKinetic kinetic(NS=1,  NP=1,  KmS = {km},  Vfwdmax = Vmax);

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vmax;
equation
  connect(rc_S1, kinetic.rc_S[1]);
  // rc_S1.c = rc_S[1].c;
  // rc_S1.r = rc_S[1].r;
  connect(rc_P1, kinetic.rc_P[1]);
  // rc_P1.c = rc_P[1].c;
  // rc_P1.r = rc_P[1].r;
end IrrUniUni;
