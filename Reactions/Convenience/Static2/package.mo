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






end Static2;
