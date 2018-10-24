within GenKinetics.UnitTests.Internal;
model OOSAIvP_rev "GenKinetics implementation of S + A + I => P"

  parameter Real I0 = 0.3 "fixed concentration of inhibitor";
  parameter Real kI = 0.77;

  parameter Real A0 = 0.5 " fixed concentration of activator";
  parameter Real kA = 0.5 "kinetic parameter";
  parameter GenKinetics.Units.Concentration S0 = 1.0;
  parameter Units.ReactionCoef vfwd = 1.0;

  parameter Real kmS = 2.0 "kinetic parameter";
  parameter Real vbwd = 0.5 "kinetic parameter";
  parameter Real kmP = 0.77 "kinetic parameter";

  NodeElements.Dynamic.Node S(c_0=S0);
  NodeElements.Dynamic.Node P(c_0=0);
  NodeElements.Dynamic.FixedConcentrationNode A(c_0=A0);
  NodeElements.Dynamic.FixedConcentrationNode I(c_0=I0);
  Reactions.Convenience.Dynamic.ActInhRevKinetic v(
    NS=1,
    NP=1,
    NA=1,
    NI=1,
    KmS={kmS},
    KmP={kmP},
    KA={kA},
    KI={kI},
    Vfwdmax=vfwd,
    Vbwdmax=vbwd);
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
end OOSAIvP_rev;
