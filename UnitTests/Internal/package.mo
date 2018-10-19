within GenKinetics.UnitTests;
package Internal "Some explicit implementation of small reactions systems"
  extends Modelica.Icons.InternalPackage;























  model SAIvP "Explicit implementation of S + A + I => P"
    Modelica.Blocks.Interfaces.RealOutput S(start = S0) annotation (
      Placement(visible = true, transformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v(start = 0) annotation (
      Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput P(start = 0) annotation (
      Placement(visible = true, transformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter Real I = 0.3;
    parameter Real kI = 0.77;
    parameter Real A = 0.5 " fixed concentration of inhibitor";
    parameter Real kA = 0.5 "kinetic parameter";
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.0 "kinetic parameter";
    parameter Real km = 2.0 "kinetic parameter";
  equation
    der(S) = -v;
    v = (kA + A) / kA * kI / (kI + I) * vfwd * S / km / (1 + S / km);
    der(P) = v;
  end SAIvP;

























  model OOSAIvP "GenKinetics implementation of S + A + I => P"

    parameter Real I0 = 0.3 "fixed concentration of inhibitor";
    parameter Real kI = 0.77;

    parameter Real A0 = 0.5 " fixed concentration of activator";
    parameter Real kA = 0.5 "kinetic parameter";
    parameter GenKinetics.Units.AffinityConst km = 2.0;
    parameter GenKinetics.Units.Concentration S0 = 1.0;
    parameter Units.ReactionCoef vfwd = 1.0;
    NodeElements.Dynamic.Node S(c_0 = S0);
    NodeElements.Dynamic.Node P(c_0 = 0);
    NodeElements.Dynamic.FixedConcentrationNode A(c_0 = A0);
    NodeElements.Dynamic.FixedConcentrationNode I(c_0 = I0);
    Reactions.Convenience.Dynamic.ActInhIrrKinetic v(NS = 1, NP = 1, NA = 1, NI = 1, KmS = {km}, KA = {kA}, KI = {kI}, Vfwdmax = vfwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    connect(v.mc_A[1], A.mc);
    connect(v.mc_I[1], I.mc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end OOSAIvP;



  annotation (
    Documentation(info = "<html><head></head><body>A package containing explicit implementation of some small reaction systems or biochemical reaction netwroks as references for unit tests&nbsp;</body></html>"));
end Internal;
