within GenKinetics.Reactions.Convenience.Static;
model IrrUniUni "S => P"
  extends Interfaces.Static.ReactionUniUni;
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vmax;

protected
  Generic.Kinetic kinetic(NS=1,  NP=1, NA=0, NI=0, KmS = {km},  Vfwdmax = Vmax, Reversible = false);

equation
  connect(rc_S1, kinetic.rc_S[1]);
  connect(rc_P1, kinetic.rc_P[1]);
  v = kinetic.v;
end IrrUniUni;
