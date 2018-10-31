within GenKinetics.UnitTests.Internal.DynamicTypes;
model OOIrrUniUni "GenKinetics implementation of S => P"
  parameter GenKinetics.Units.AffinityConst km = 2.0;
  parameter GenKinetics.Units.Concentration S0 = 1.0;
  parameter Units.ReactionCoef vfwd = 1.0;
  NodeElements.Dynamic.Node S(c_0=S0);
  NodeElements.Dynamic.Node P(c_0=0);
  ReactionTypes.IrrUniUni v(KmS={km}, Vfwdmax=vfwd);
  Modelica.Blocks.Interfaces.RealOutput Sc annotation (
    Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pc annotation (
    Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput r annotation (
    Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(S.rc, v.rc_S[1]);
  connect(v.rc_P[1], P.rc);
  Sc = S.c;
  Pc = P.c;
  v.v = r;
  annotation (
    Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
end OOIrrUniUni;
