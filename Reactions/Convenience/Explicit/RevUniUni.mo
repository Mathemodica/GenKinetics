within GenKinetics.Reactions.Convenience.Explicit;
model RevUniUni "S <=> P"
  extends Interfaces.Reactions.Uur;
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst kmS;
  parameter Units.ReactionCoef Vfwdmax;
  parameter GenKinetics.Units.AffinityConst kmP;
  parameter Units.ReactionCoef Vbwdmax;

protected
  Generic.Kinetic kinetic(NS=1,  NP=1, NA=0, NI=0, KmS = {kmS},
                          Vfwdmax = Vfwdmax, KmP = {kmP}, Vbwdmax = Vbwdmax,
                          Reversible=Reversible);

equation
  connect(rc_S1, kinetic.rc_S[1]);
  connect(rc_P1, kinetic.rc_P[1]);
  v = kinetic.v;
end RevUniUni;
