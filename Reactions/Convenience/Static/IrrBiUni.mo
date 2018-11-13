within GenKinetics.Reactions.Convenience.Static;
model IrrBiUni "S1 + S2 => P"
  extends Interfaces.Static.ReactionBiUni;
  extends Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km1;
  parameter GenKinetics.Units.AffinityConst km2;
  parameter Units.ReactionCoef Vmax;

protected
  Generic.Kinetic kinetic(NS=2,NP=1,NA=0,NI=0,
                          KmS = {km1, km2}, Vfwdmax = Vmax,
                          Reversible=false);

equation
  connect(rc_S1, kinetic.rc_S[1]);
  connect(rc_S2, kinetic.rc_S[2]);
  connect(rc_P1, kinetic.rc_P[1]);
  v = kinetic.v;
end IrrBiUni;
