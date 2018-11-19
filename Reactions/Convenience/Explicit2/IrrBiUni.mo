within GenKinetics.Reactions.Convenience.Explicit2;
model IrrBiUni "S1 + S2 => P"
  extends Interfaces.Reactions.Bui;
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km1;
  parameter GenKinetics.Units.AffinityConst km2;
  parameter Units.ReactionCoef Vmax;

protected
  Auto.IrrKinetic kinetic(
    NS=2,
    NP=1,
    KmS={km1,km2},
    Vfwdmax=Vmax);

equation
  connect(rc_S1, kinetic.rc_S[1]);
  connect(rc_S2, kinetic.rc_S[2]);
  connect(rc_P1, kinetic.rc_P[1]);
  v = kinetic.v;
end IrrBiUni;
