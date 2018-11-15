within GenKinetics.Reactions.Convenience.Static;
model IrrUniBiI1 "S + I => P1 + P2"
  extends Interfaces.Reactions.UniBiI1;
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vfwdmax;
  parameter Units.AffinityConst ki;

protected
  Generic.Kinetic kinetic(NS=1, NP=2,  NI=1, NA=0,
                          KmS = {km}, Vfwdmax = Vfwdmax, KI = {ki},
                          Reversible = false);

equation
  connect(rc_S1, kinetic.rc_S[1]);
  connect(rc_P1, kinetic.rc_P[1]);
  connect(rc_P2, kinetic.rc_P[2]);
  connect(mc_I1, kinetic.mc_I[1]);
  v = kinetic.v;
end IrrUniBiI1;
