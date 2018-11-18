within GenKinetics.Reactions.Convenience.Explicit2;
model IrrUniUniI1 "S + I => P"
  extends Interfaces.Reactions.UniUniI1Irr;
  extends Interfaces.Reactions.ReactionRate;

  parameter GenKinetics.Units.AffinityConst km;
  parameter Units.ReactionCoef Vmax;
  parameter Units.AffinityConst ki;

protected
  Auto.InhIrrKinetic kinetic(
    NS=1,
    NP=1,
    NI=1,
    KmS={km},
    Vfwdmax=Vmax,
    KI={ki});

equation
 connect(rc_S1, kinetic.rc_S[1]);

 connect(rc_P1, kinetic.rc_P[1]);

 connect(mc_I1, kinetic.mc_I[1]);

 v = kinetic.v;
end IrrUniUniI1;
