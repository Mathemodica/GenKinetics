within GenKinetics.Reactions.Convenience;
package Static2
  extends Modelica.Icons.VariantsPackage;

  model IrrUniUniI1 "S + I => P"
    extends Interfaces.Static.ReactionUniUni1I;
    extends Reactions.ReactionRate;

    parameter GenKinetics.Units.AffinityConst km;
    parameter Units.ReactionCoef Vmax;
    parameter Units.AffinityConst ki;

protected
    Dynamic.InhIrrKinetic kinetic(NS=1, NP=1, NI=1, KmS = {km}, Vfwdmax = Vmax, KI = {ki});

  equation
   connect(rc_S1, kinetic.rc_S[1]);

   connect(rc_P1, kinetic.rc_P[1]);

   connect(mc_I1, kinetic.mc_I[1]);

   v = kinetic.v;
  end IrrUniUniI1;



  model RevUniUni "S <=> P"
    extends Interfaces.Static.ReactionUniUni;
    extends Reactions.ReactionRate;

    parameter GenKinetics.Units.AffinityConst kmS;
    parameter Units.ReactionCoef Vfwdmax;
    parameter GenKinetics.Units.AffinityConst kmP;
    parameter Units.ReactionCoef Vbwdmax;

protected
    Dynamic.RevKinetic kinetic(NS=1,NP=1,KmS = {kmS}, Vfwdmax = Vfwdmax, KmP = {kmP}, Vbwdmax = Vbwdmax);

  equation
    connect(rc_S1, kinetic.rc_S[1]);
    connect(rc_P1, kinetic.rc_P[1]);
    v = kinetic.v;
  end RevUniUni;



  model IrrBiUni "S1 + S2 => P"
    extends Interfaces.Static.ReactionBiUni;
    extends Reactions.ReactionRate;

    parameter GenKinetics.Units.AffinityConst km1;
    parameter GenKinetics.Units.AffinityConst km2;
    parameter Units.ReactionCoef Vmax;

protected
    Dynamic.IrrKinetic kinetic(NS=2,NP=1,KmS = {km1, km2}, Vfwdmax = Vmax);

  equation
    connect(rc_S1, kinetic.rc_S[1]);
    connect(rc_S2, kinetic.rc_S[2]);
    connect(rc_P1, kinetic.rc_P[1]);
    v = kinetic.v;
  end IrrBiUni;



  model IrrUniBiI1 "S + I => P1 + P2"
    extends Interfaces.Static.ReactionUniBiI1;
    extends Reactions.ReactionRate;

    parameter GenKinetics.Units.AffinityConst km;
    parameter Units.ReactionCoef Vfwdmax;
    parameter Units.AffinityConst ki;

protected
    Dynamic.InhIrrKinetic kinetic(NS=1, NP=2,  NI=1, KmS = {km}, Vfwdmax = Vfwdmax, KI = {ki});

  equation
    connect(rc_S1, kinetic.rc_S[1]);
    connect(rc_P1, kinetic.rc_P[1]);
    connect(rc_P2, kinetic.rc_P[2]);
    connect(mc_I1, kinetic.mc_I[1]);
    v = kinetic.v;
  end IrrUniBiI1;


















end Static2;
