within GenKinetics.UnitTests.Internal;
model OOSIvP_rev "GenKinetics implementation of S + I <=> P"

  parameter Real I0 = 0.5 " fixed concentration of inhibitor";
  parameter Real kI = 0.5 "kinetic parameter";
  parameter Real S0 = 1.0 "initial concentration of S";
  parameter Real vfwd = 1.5 "kinetic parameter";
  parameter Real vbwd = 0.5 "kinetic parameter";
  parameter Real kmS = 2.0 "kinetic parameter";
  parameter Real kmP = 0.3 "kinetic parameter";

  NodeElements.Dynamic.FixedConcentrationNode I(c_0=I0);
  NodeElements.Dynamic.Node S(c_0 = S0);
  NodeElements.Dynamic.Node P(c_0 = 0);
  Reactions.Convenience.Dynamic.InhRevKinetic v(NI=1,KmS = {kmS}, KmP = {kmP}, KI = {kI}, Vfwdmax = vfwd, Vbwdmax = vbwd);
  Modelica.Blocks.Interfaces.RealOutput Sc annotation (
    Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pc annotation (
    Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput r annotation (
    Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation

  connect(S.rc, v.rc_S[1]);
  connect(v.rc_P[1], P.rc);
  connect(v.mc_I[1],I.mc);

  Sc = S.c;
  Pc = P.c;
  v.v = r;
  annotation (
    Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
end OOSIvP_rev;
