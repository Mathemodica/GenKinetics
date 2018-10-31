within GenKinetics.Reactions.Convenience;
package Static2
  extends Modelica.Icons.VariantsPackage;

  model IrrUniUniI1 "S + I => P"
  extends Interfaces.Static.ReactionUniUni1I;
    /* model Kinetic = GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(redeclare final model Dimensionality = GenKinetics.Interfaces.Dynamic.Dimension.UniUni, NI=1);
    Kinetic kinetic(KmS = {km}, Vfwdmax = Vmax, KI = {ki}); */

    Dynamic.InhIrrKinetic kinetic(NS=1, NP=1, NI=1, KmS = {km}, Vfwdmax = Vmax, KI = {ki});

    parameter GenKinetics.Units.AffinityConst km;
    parameter Units.ReactionCoef Vmax;
    parameter Units.AffinityConst ki;
  equation
   connect(rc_S1, kinetic.rc_S[1]);
  /* rc_S1.c = kinetic.rc_S[1].c;
 rc_S1.r = kinetic.rc_S[1].r; */
   connect(rc_P1, kinetic.rc_P[1]);
   /* rc_P1.c = kinetic.rc_P[1].c;
   rc_P1.r = kinetic.rc_P[1].r; */
    connect(mc_I1, kinetic.mc_I[1]);
  end IrrUniUniI1;



  model RevUniUni "S <=> P"
    extends Interfaces.Static.ReactionUniUni;
    Dynamic.RevKinetic kinetic(NS=1,NP=1,KmS = {kmS}, Vfwdmax = Vfwdmax, KmP = {kmP}, Vbwdmax = Vbwdmax);
    parameter GenKinetics.Units.AffinityConst kmS;
    parameter Units.ReactionCoef Vfwdmax;
    parameter GenKinetics.Units.AffinityConst kmP;
    parameter Units.ReactionCoef Vbwdmax;
  equation
    connect(rc_S1, kinetic.rc_S[1]);
    connect(rc_P1, kinetic.rc_P[1]);
  end RevUniUni;



  model IrrBiUni "S1 + S2 => P"
    extends Interfaces.Static.ReactionBiUni;
    Dynamic.IrrKinetic kinetic(NS=2,NP=1,KmS = {km1, km2}, Vfwdmax = Vmax);
    parameter GenKinetics.Units.AffinityConst km1;
    parameter GenKinetics.Units.AffinityConst km2;
    parameter Units.ReactionCoef Vmax;
  equation
    connect(rc_S1, kinetic.rc_S[1]);
    connect(rc_S2, kinetic.rc_S[2]);
    connect(rc_P1, kinetic.rc_P[1]);
  end IrrBiUni;



  model IrrUniBiI1 "S + I => P1 + P2"
    extends Interfaces.Static.ReactionUniBiI1;
    /*model Kinetic = GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(redeclare final model Dimensionality = GenKinetics.Interfaces.Dynamic.Dimension.UniBi, NI=1);
    Kinetic kinetic(KmS = {km}, Vfwdmax = Vfwdmax, KI = {ki});
    */
    Dynamic.InhIrrKinetic kinetic(NS=1, NP=2 , NI=1, KmS = {km}, Vfwdmax = Vfwdmax, KI = {ki});
    parameter GenKinetics.Units.AffinityConst km;
    parameter Units.ReactionCoef Vfwdmax;
    parameter Units.AffinityConst ki;
  equation
    connect(rc_S1, kinetic.rc_S[1]);
    connect(rc_P1, kinetic.rc_P[1]);
    connect(rc_P2, kinetic.rc_P[2]);
    connect(mc_I1, kinetic.mc_I[1]);
  end IrrUniBiI1;


















end Static2;
