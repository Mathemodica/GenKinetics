within GenKinetics.Reactions.Convenience.Explicit2;
model IrrUniBiI1 "S + I => P1 + P2"
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vfwdmax;
  parameter Units.AffinityConst ki;

protected
  Auto.InhIrrKinetic kinetic(
    NS=1,
    NP=2,
    NI=1,
    KmS={km},
    Vfwdmax=Vfwdmax,
    KI={ki});

equation
  connect(rc_S1, kinetic.rc_S[1]);
  connect(rc_P1, kinetic.rc_P[1]);
  connect(rc_P2, kinetic.rc_P[2]);
  connect(mc_I1, kinetic.mc_I[1]);
  v = kinetic.v;
end IrrUniBiI1;
